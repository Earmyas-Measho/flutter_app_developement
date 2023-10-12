import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Personal Card'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment
              .center, // this will center your widget vertically.
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('asset/bil.jpg'),
            ),
            const SizedBox(height: 16),
            Text(
              'Earmyas Measho Gebre',
              style: GoogleFonts.dancingScript(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              // this will center your widget horizontally.
              child: Card(
                color: Colors.blue[100],
                elevation: 9.0,
                shape: RoundedRectangleBorder(
                  // rounded corners
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Student at Linnaeus University',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8), // Add some vertical spacing
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 8), // Add some spacing
                          Text('Email: earmyas@yahoo.com'),
                        ],
                      ),
                      SizedBox(height: 8), // Add some vertical spacing
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 8), // Add some spacing
                          Text('Phone: 46735701870'),
                        ],
                      ),
                      SizedBox(height: 8), // Add some vertical spacing
                      Row(
                        children: [
                          Icon(Icons.web),
                          SizedBox(width: 8), // Add some spacing
                          Text('Website: www.earmyas.com'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
