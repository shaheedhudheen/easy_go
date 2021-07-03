import 'dart:async';

import 'package:easy_go/models/place.dart';
import 'package:easy_go/screens/construction.dart';
import 'package:easy_go/screens/maps/applicationBloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _mapController = Completer();
  var textController = new TextEditingController();

  StreamSubscription locationSubscription;
  StreamSubscription boundsSubscription;

  @override
  void initState() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);

    locationSubscription =
        applicationBloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        goToPlace(place);
      }
    });

    boundsSubscription = applicationBloc.bounds.stream.listen((bounds) async {
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50.0));
    });

    super.initState();
  }

  @override
  void dispose() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    boundsSubscription.cancel();
    locationSubscription.cancel();

    super.dispose();
  }

  searchField() {}
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(47, 46, 65, 1),
      body: (applicationBloc.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(108, 99, 255, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(108, 99, 255, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(108, 99, 255, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.all(20),
                          hintText: 'Search Location',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'semi bold',
                          ),
                        ),
                        onChanged: (String textValue) {
                          applicationBloc.searchPlaces(textValue);
                        }),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(108, 99, 255, 1.0)),
                              borderRadius: BorderRadius.circular(30)),
                          height: 400,
                          // padding: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                            child: GoogleMap(
                              mapType: MapType.normal,
                              markers: Set<Marker>.of(applicationBloc.markers),
                              myLocationEnabled: true,
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      applicationBloc.currentLocation.latitude,
                                      applicationBloc
                                          .currentLocation.longitude),
                                  zoom: 13.5),
                              onMapCreated: (GoogleMapController controller) {
                                _mapController.complete(controller);
                              },
                            ),
                          ),
                        ),
                      ),
                      if (applicationBloc.searchResults != null &&
                          applicationBloc.searchResults.length != 0)
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.6),
                            backgroundBlendMode: BlendMode.darken,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      if (applicationBloc.searchResults != null &&
                          applicationBloc.searchResults.length != 0)
                        Container(
                          height: 300,
                          child: ListView.builder(
                            itemCount: applicationBloc.searchResults.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(
                                    applicationBloc
                                        .searchResults[0].description,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    applicationBloc.setSelectedLocation(
                                        applicationBloc
                                            .searchResults[index].placeId);
                                    textController.text = applicationBloc
                                        .searchResults[index].description;
                                  });
                            },
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Amenities',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bold',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Wrap(
                      spacing: 10,
                      children: [
                        FilterChip(
                          avatar: Image(
                            width: 35,
                            height: 35,
                            image: AssetImage('assets/images/hotels.png'),
                          ),
                          elevation: 10,
                          label: Text(
                            ' Hotels  ',
                            style: TextStyle(
                              color: Color.fromRGBO(47, 46, 65, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'semi bold',
                            ),
                          ),
                          onSelected: (val) => applicationBloc.togglePlaceType(
                              'restaurant', val),
                          selected: applicationBloc.placeType == 'restaurant',
                          selectedColor: Color.fromRGBO(108, 99, 255, 1.0),
                          disabledColor: Color.fromRGBO(108, 99, 255, 1.0),
                        ),
                        FilterChip(
                          avatar: Image(
                            width: 35,
                            height: 35,
                            image: AssetImage('assets/images/hospital.png'),
                          ),
                          elevation: 10,
                          label: Text(
                            ' Hospital ',
                            style: TextStyle(
                              color: Color.fromRGBO(47, 46, 65, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'semi bold',
                            ),
                          ),
                          onSelected: (val) =>
                              applicationBloc.togglePlaceType('hospital', val),
                          selected: applicationBloc.placeType == 'hospital',
                          selectedColor: Color.fromRGBO(108, 99, 255, 1.0),
                          disabledColor: Color.fromRGBO(108, 99, 255, 1.0),
                        ),
                        FilterChip(
                          avatar: Image(
                            width: 35,
                            height: 35,
                            image: AssetImage('assets/images/places.png'),
                          ),
                          elevation: 10,
                          label: Text(
                            ' Places  ',
                            style: TextStyle(
                              color: Color.fromRGBO(47, 46, 65, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'semi bold',
                            ),
                          ),
                          onSelected: (val) => applicationBloc.togglePlaceType(
                              'tourist_attraction', val),
                          selected:
                              applicationBloc.placeType == 'tourist_attraction',
                          selectedColor: Color.fromRGBO(108, 99, 255, 1.0),
                          disabledColor: Color.fromRGBO(108, 99, 255, 1.0),
                        ),
                        FilterChip(
                          avatar: Image(
                            width: 35,
                            height: 35,
                            image: AssetImage('assets/images/gas.png'),
                          ),
                          elevation: 10,
                          label: Text(
                            '    Gas      ',
                            style: TextStyle(
                              color: Color.fromRGBO(47, 46, 65, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'semi bold',
                            ),
                          ),
                          onSelected: (val) => applicationBloc.togglePlaceType(
                              'gas_station', val),
                          selected: applicationBloc.placeType == 'gas_station',
                          selectedColor: Color.fromRGBO(108, 99, 255, 1.0),
                          disabledColor: Color.fromRGBO(108, 99, 255, 1.0),
                        ),
                        FilterChip(
                          avatar: Image(
                            width: 30,
                            height: 29,
                            image: AssetImage('assets/images/atm.png'),
                          ),
                          elevation: 10,
                          label: Text(
                            '   ATM    ',
                            style: TextStyle(
                              color: Color.fromRGBO(47, 46, 65, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'semi bold',
                            ),
                          ),
                          onSelected: (val) =>
                              applicationBloc.togglePlaceType('atm', val),
                          selected: applicationBloc.placeType == 'atm',
                          selectedColor: Color.fromRGBO(108, 99, 255, 1.0),
                          disabledColor: Color.fromRGBO(108, 99, 255, 1.0),
                        ),
                        FilterChip(
                          // avatar: Image(
                          //   width: 30,
                          //   height: 29,
                          //   image: AssetImage('assets/images/atm.png'),
                          // ),
                          elevation: 10,
                          label: Text(
                            '     More...    ',
                            style: TextStyle(
                              color: Color.fromRGBO(47, 46, 65, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'semi bold',
                            ),
                          ),

                          onSelected: (val) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Construction()),
                            );
                          },
                          // selected: applicationBloc.placeType == 'atm',
                          selectedColor: Color.fromRGBO(108, 99, 255, 1.0),
                          disabledColor: Color.fromRGBO(108, 99, 255, 1.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(place.geometry.location.lat, place.geometry.location.lng),
        zoom: 14.0)));
  }
}
