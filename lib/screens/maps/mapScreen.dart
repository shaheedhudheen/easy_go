import 'package:easy_go/screens/maps/applicationBloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  applicationBloc.currentLocation.latitude,
                                  applicationBloc.currentLocation.longitude),
                              zoom: 14),
                        ),
                      ),
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.6),
                            backgroundBlendMode: BlendMode.darken),
                      ),
                      // Container(
                      //   child: ListView.builder(
                      //     itemCount: applicationBloc.searchResults.length,
                      //     itemBuilder: (context, index) {
                      //       return ListTile(
                      //         title: Text(
                      //           applicationBloc
                      //               .searchResults[index].description,
                      //           style: TextStyle(color: Colors.white),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
