import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                'Project Weather',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text(
            'This is an app that is developed for the course 1dv535 at Linnaeus University using Flutter and the OpenWeatherApp API.',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: Text(
              'Developed by Earmyas Measho Gebre',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
