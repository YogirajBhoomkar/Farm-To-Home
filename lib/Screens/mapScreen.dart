import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fthve2/Screens/societyScreen.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';



class mapScreen extends StatefulWidget {
  static String id="mapScreen";

  @override
  _mapScreenState createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  @override
  Completer<GoogleMapController> controller1;

  //static LatLng _center = LatLng(-15.4630239974464, 28.363397732282127);
  static LatLng _initialPosition;
  final Set<Marker> _markers = {};
  static  LatLng _lastMapPosition = _initialPosition;
  String locationButtonText="Get my Location";
  bool buttonClickedonce=false;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }
  void _getUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
    });
  }

    _getLocation() async
  {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
  }



  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1.complete(controller);
    });
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onAddMarkerButtonPressed() {

    setState(() {
      _markers.add(
          Marker(
              markerId: MarkerId(_lastMapPosition.toString()),
              position: _lastMapPosition,
              infoWindow: InfoWindow(
                  title: "Your Current Position",
                  snippet: "Set This as My Address",
                  onTap: (){
                  }
              ),
              onTap: (){
              },

              icon: BitmapDescriptor.defaultMarker));
    });
  }





  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: function,
      child: icon,
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(7.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initialPosition == null ? Container(child: Center(child:Text('loading map..', style: TextStyle( fontSize:ScreenUtil().setSp(20),fontFamily: 'Roboto', color: Colors.grey[400]),),),) : Container(
        child: Stack(children: <Widget>[
          GoogleMap(
            markers: _markers,

            mapType: _currentMapType,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14.4746,
            ),
            onMapCreated: _onMapCreated,
            zoomGesturesEnabled: true,
            onCameraMove: _onCameraMove,
            myLocationEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: false,

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:EdgeInsets.all( ScreenUtil().setHeight(10),),
                child: Container(
                  margin: EdgeInsets.only(
                    bottom:ScreenUtil().setHeight(30),
                    left: ScreenUtil().setWidth(50),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  width: 300.w,
                  height: 70.h,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(10),
                      ),
                    ),
                    color: Color(0xFF18BA77),
                    onPressed: () {

                      if(buttonClickedonce==true){
                        setState(() {
                          Navigator.pushNamed(context, societyScreen.id);
                        });

                      }
                      _onAddMarkerButtonPressed();
                      setState(() {
                        buttonClickedonce=true;
                        locationButtonText="Set Location";
                        _getLocation();
                      });


                    },
                    child: Text(

                      locationButtonText,
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}




