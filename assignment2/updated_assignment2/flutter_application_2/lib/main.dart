import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My ToDo List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: "Enter todo item",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_textFieldController.text.isNotEmpty) {
                  _todoList.add(_textFieldController.text);
                  _textFieldController.clear();
                }
              });
            },
            child: Text("Add Item"),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
          ),
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_todoList[index]),
                    onTap: () {
                      setState(() {
                        _textFieldController.text = _todoList[index];
                        _todoList.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
