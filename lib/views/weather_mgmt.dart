import 'package:flutter/material.dart';

class WeatherMgmt extends StatefulWidget {
  const WeatherMgmt({Key? key}) : super(key: key);

  @override
  State<WeatherMgmt> createState() => _WeatherMgmtState();
}

class _WeatherMgmtState extends State<WeatherMgmt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit/add weather'),
      ),
    );
  }
}
