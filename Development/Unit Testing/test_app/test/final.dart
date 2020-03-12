import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shake/shake.dart';
import 'package:share/share.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GeoListenPage(),
    );
  }
}

class GeoListenPage extends StatefulWidget {
  @override
  _GeoListenPageState createState() => _GeoListenPageState();
}

class _GeoListenPageState extends State<GeoListenPage> {
  Geolocator geolocator = Geolocator();

  Position userLocation;
  String _currentAddress;

  _textMe(currentAddress, lat, long) async {
    String lat = userLocation.latitude.toString();
    String long = userLocation.longitude.toString();

    String raw = r'1&query';
    // Android
    String uri =
        'sms:1234567890?body=I am Here: $currentAddress Maps: https://www.google.com/maps/search/?api=$raw$lat,$long';
    String uri2 =
        'I am Here: $currentAddress Maps: https://www.google.com/maps/search/?api=$raw$lat,$long';
    if (await canLaunch(uri)) {
      await launch(uri);
      Share.share('$uri2');
    } else {
      // iOS
      String uri =
          'sms:1234567890?body=I am Here: $currentAddress Maps: https://www.google.com/maps/search/?api=$raw$lat,$long';
      String uri2 =
          'I am Here: $currentAddress Maps: https://www.google.com/maps/search/?api=$raw$lat,$long';
      if (await canLaunch(uri)) {
        await launch(uri);
        Share.share('$uri2');
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      _textMe(_currentAddress, userLocation.latitude, userLocation.longitude);
    });

    _getLocation().then((position) {
      userLocation = position;
    });

    detector.mShakeCount = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ideas'),
        backgroundColor: Color.fromARGB(255, 29, 29, 27),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Container(),
              height: 150,
              width: 150,
            ),
//            Image.asset(),
            userLocation == null
                ? CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  )
                : ListTile(
                    leading: Icon(
                      Icons.location_on,
                      size: 45.0,
                      color: Color.fromARGB(255, 177, 24, 39),
                    ),
                    title: Text("Location:" +
                        userLocation.latitude.toString() +
                        " " +
                        userLocation.longitude.toString()),
                    subtitle: Text(_currentAddress),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });

                    _getAddressFromLatLng(userLocation);
                  });
                },
                color: Color.fromARGB(255, 29, 29, 27),
                child: Text(
                  "Get Location",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  openMap(userLocation.latitude, userLocation.longitude);
                },
                color: Color.fromARGB(255, 29, 29, 27),
                child: Text(
                  "Navigate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  Future<Position> _getLocation() async {
    var currentLocation;

    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
    } catch (e) {
      currentLocation = null;
    }

    return currentLocation;
  }

  _getAddressFromLatLng(currentLocation) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          currentLocation.latitude, currentLocation.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
