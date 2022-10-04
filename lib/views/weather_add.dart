import 'package:flutter/material.dart';

class WeatherAdd extends StatefulWidget {
  const WeatherAdd({super.key});

  @override
  State<WeatherAdd> createState() => _WeatherAddState();
}

class _WeatherAddState extends State<WeatherAdd> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dodaj miasto'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    hintText: 'Nazwa miasta'),
              ),
              Row(
                children: [
                  Checkbox(
                    value: this.isFav,
                    onChanged: (bool? val) {
                      print('new value:' + val.toString());
                      this.setState(() {
                        this.isFav = val!;
                      });
                    },
                  ),
                  const Text('Ulubione')
                ],
              ),
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: const Text('Zapisz'),),
            ],
          ),
        ));
  }
}
