import 'dart:async';

import 'package:easy_go/models/place.dart';
import 'package:easy_go/screens/maps/applicationBloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _mapController = Completer();

  StreamSubscription locationSubscription;
  StreamSubscription boundsSubscription;

  @override
  void initState() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);

    locationSubscription =
        applicationBloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        _goToPlace(place);
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

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
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
                      decoration: InputDecoration(
                        hintText: 'Search Location',
                        suffixIcon: Icon(Icons.search),
                      ),
                      onChanged: (String textValue) =>
                          applicationBloc.searchPlaces(textValue),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: Set<Marker>.of(applicationBloc.markers),
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  applicationBloc.currentLocation.latitude,
                                  applicationBloc.currentLocation.longitude),
                              zoom: 14),
                          onMapCreated: (GoogleMapController controller) {
                            _mapController.complete(controller);
                          },
                        ),
                      ),
                      if (applicationBloc.searchResults != null &&
                          applicationBloc.searchResults.length != 0)
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.6),
                              backgroundBlendMode: BlendMode.darken),
                        ),
                      if (applicationBloc.searchResults != null &&
                          applicationBloc.searchResults.length != 0)
                        Container(
                          height: 200,
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
                                  });
                            },
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Filter Results',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8.0,
                      children: [
                        FilterChip(
                          label: Text('Hotels'),
                          onSelected: (val) => applicationBloc.togglePlaceType(
                              'restaurant', val),
                          selected: applicationBloc.placeType == 'restaurant',
                          selectedColor: Colors.blue,
                        ),
                        FilterChip(
                          label: Text('Places'),
                          onSelected: (val) => applicationBloc.togglePlaceType(
                              'tourist_attraction', val),
                          selected:
                              applicationBloc.placeType == 'tourist_attraction',
                          selectedColor: Colors.blue,
                        ),
                        FilterChip(
                          label: Text('Gas Stations'),
                          onSelected: (val) => applicationBloc.togglePlaceType(
                              'gas_station', val),
                          selected: applicationBloc.placeType == 'gas_station',
                          selectedColor: Colors.blue,
                        ),
                        FilterChip(
                          label: Text('ATM'),
                          onSelected: (val) =>
                              applicationBloc.togglePlaceType('atm', val),
                          selected: applicationBloc.placeType == 'atm',
                          selectedColor: Colors.blue,
                        ),
                        FilterChip(
                          label: Text('Hospitals'),
                          onSelected: (val) =>
                              applicationBloc.togglePlaceType('hospital', val),
                          selected: applicationBloc.placeType == 'hospital',
                          selectedColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(place.geometry.location.lat, place.geometry.location.lng),
        zoom: 14.0)));
  }
}
