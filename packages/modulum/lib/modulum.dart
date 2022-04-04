library modulum;

import 'package:flutter/material.dart';
import 'package:modulum/types/user_data.dart';

class Modulum extends StatefulWidget {
  final Function fetchData;
  const Modulum({Key? key, required this.fetchData}) : super(key: key);

  @override
  State<Modulum> createState() => _ModulumState();
}

class _ModulumState extends State<Modulum> {
  String name = "nobody";
  String message = "nothing";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Column(
        children: [
          Text(
            "Module Side",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            "$name said $message",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade400)),
              onPressed: () {
                User data = widget.fetchData();
                setState(() {
                  name = data.name;
                  message = data.message;
                });
              },
              child: const Text(
                "Fetch Text",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
