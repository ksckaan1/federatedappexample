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
  String text = "empty";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Column(
        children: [
          Text("Text is $text"),
          TextButton(
              onPressed: () {
                User user = widget.fetchData();
                setState(() {
                  text = user.name;
                });
              },
              child: const Text("Fetch Text"))
        ],
      ),
    );
  }
}
