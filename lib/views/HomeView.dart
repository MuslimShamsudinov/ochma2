import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:ochma2/main.dart';
import 'package:ochma2/views/SearchView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String city = '';
  double temp = 0;
  @override
  void initState() {
    showWeather();
    super.initState();
  }

  Future<void> showWeather() async {
    final position = await getPosition();
    log('Position latitude ===> ${position.latitude}');
    log('Position longitude ===> ${position.longitude}');
    abayirainAlipKel(position);
  }

  Future<void> abayirainAlipKel(Position position) async {
    var client = Client();
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}.&lon=${position.longitude}&appid=6fc51caca8e07e7f034e6fbdf32c5828');
    final Vremya = await client.get(uri);
    final jsonAnswer = jsonDecode(Vremya.body);
    city = jsonAnswer['main'];
    temp = jsonAnswer['main']['temp'];
    log('Vremya===>$Vremya');
    // log('$city');
    setState(() {});
  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            setState(() {});
          },
          child: Icon(
            Icons.near_me,
            size: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => SearchView()),
                ),
              );
            }),
            icon: Icon(
              Icons.location_city,
              size: 60,
            ),
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cabin-g91ebe98b0_1920.jpg'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 250,
                  left: 40,
                  child: Text(
                    '$temp °C'.toUpperCase(),
                    style: TextStyle(fontSize: 62, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  top: 180,
                  left: 155,
                  child: Text(
                    '⛅'.toUpperCase(),
                    style: TextStyle(fontSize: 58, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  top: 400,
                  right: 20,
                  child: Text(
                    'You\'ll',
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  top: 50,
                  left: 180,
                  child: Text(
                    city.toString(),
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                top: 500,
                left: 150,
                child: Text(
                  'need',
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 500,
                left: 330,
                child: Text(
                  '🍦',
                  style: TextStyle(fontSize: 58, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  top: 600,
                  left: 160,
                  child: Text(
                    'and',
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  ))
            ],
          )),
    );
  }
}
