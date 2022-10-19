import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WeatherAdd extends StatefulWidget {
  final Database database;

  const WeatherAdd({super.key, required this.database});

  @override
  State<WeatherAdd> createState() => _WeatherAddState();
}

class _WeatherAddState extends State<WeatherAdd> {
  bool isFav = false;
  TextEditingController cityNameFieldController = new TextEditingController();

  void addCityToDb(String cityName, bool isFav) async {
    int isFavDigit = isFav ? 1 : 0;
    await widget.database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO cities(city_name, is_fav) VALUES("$cityName", $isFavDigit)');
      print('inserted city with id: $id');
    });
  }

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
                controller: cityNameFieldController,
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
              ElevatedButton(
                onPressed: () {
                  print(cityNameFieldController.value.text.toString() +
                      '' +
                      this.isFav.toString());
                  addCityToDb(cityNameFieldController.value.text.toString(),
                      this.isFav);

                  Navigator.of(context).pop();
                },
                child: const Text('Zapisz'),
              ),
            ],
          ),
        ));
  }
}
