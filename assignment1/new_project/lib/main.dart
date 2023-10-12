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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const Card(
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('earmyas@yahoo.com'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text('46735701870'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.web),
                title: Text('Website'),
                subtitle: Text('www.earmyas.com'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
