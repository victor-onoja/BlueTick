import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class liveLocationMap extends StatefulWidget {
  const liveLocationMap({
    Key? key,
  }) : super(key: key);

  @override
  State<liveLocationMap> createState() => _liveLocationMapState();
}

class _liveLocationMapState extends State<liveLocationMap> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(6.264092, 6.201883),
    zoom: 15,
    tilt: 50,
  );

  GoogleMapController? googleMapController;

  @override
  void dispose() {
    // TODO: implement dispose
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(22, 40, 80, 0.5),
              offset: const Offset(0, -350),
              blurRadius: 80,
            ),
          ]),
      child: Stack(
        //alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              rotateGesturesEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: (controller) => googleMapController = controller,
              markers: {
                Marker(
                  markerId: const MarkerId('John Mack'),
                  infoWindow: const InfoWindow(
                    title: 'John Mark',
                    anchor: Offset(0, 0),
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                  position: LatLng(6.264092, 6.201883),
                ),
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: AppTheme.darkBlue,
                size: 40,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                color: blue2.withOpacity(0.9),
                alignment: Alignment.center,
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ImageIcon(AssetImage('Assets/images/location.png'),
                            color: darkBlue),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            googleMapController?.animateCamera(
                              CameraUpdate.newCameraPosition(
                                  _initialCameraPosition),
                            );
                          },
                          child: Text(
                            'Agbor, Delta',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.darkBlue2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '5.15km Away',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.darkBlue2,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}
