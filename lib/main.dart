import 'package:flutter/material.dart';
import 'package:modulum/modulum.dart';
import 'package:modulum/types/user_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Federated App Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Federated App Example'),
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
  var _controller = TextEditingController();

  fetchData() {
    var userData = User("kaan", _controller.text);
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text(
            "Host Side",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              decoration:
                  const InputDecoration(hintText: " enter message here")),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: Modulum(fetchData: fetchData),
          )
        ],
      ),
    );
  }
}
