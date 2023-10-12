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
            decoration: const InputDecoration(
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
            child: const Text("Add Item"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // updated from primary
              foregroundColor: Colors.white, // updated from onPrimary
            ),
          ),
          Expanded(
            child: Scrollbar(
              interactive: true, // updated from isAlwaysShown
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_textFieldController.text.isNotEmpty) {
            setState(() {
              _todoList.add(_textFieldController.text);
              _textFieldController.clear();
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
