import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class ForecastWeatherPage extends StatefulWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  _ForecastWeatherPageState createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {
  List<Map<String, dynamic>>? _forecastData;

  @override
  void initState() {
    super.initState();
    _fetchForecastData();
  }

  Future<bool> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
      if (!status.isGranted) {
        return false;
      }
    }
    return true;
  }

  Future<void> _fetchForecastData() async {
    if (!(await _requestLocationPermission())) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Location Permission'),
            content: const Text(
                'This app needs location permission to fetch weather data. Please grant the permission.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
      return;
    }
    Position position = await _getCurrentLocation();
    List<Map<String, dynamic>> forecastData = await _getForecastData(position);
    setState(() {
      _forecastData = forecastData;
    });
  }

  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<List<Map<String, dynamic>>> _getForecastData(Position position) async {
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&appid=49ea0033ba6acc29fb7c3d873f5facd5&units=metric'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['list'].cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_forecastData == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: _forecastData?.length ?? 0,
        itemBuilder: (context, index) {
          final forecast = _forecastData![index];
          return ListTile(
            title: Text(
                'Temperature: ${forecast['main']['temp']}°C at ${forecast['dt_txt']}'),
            subtitle: Text('Weather: ${forecast['weather'][0]['description']}'),
          );
        },
      );
    }
  }
}
