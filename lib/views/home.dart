import 'package:flutter/material.dart';
import 'package:weather_app/views/weather_add.dart';
import 'package:weather_app/views/weather_details.dart';
import 'package:weather_app/views/weather_mgmt.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Database database;

  void initDb() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      version: 1,
    );
    List<Map> citiesList =
        await db.rawQuery('SELECT id, city_name FROM cities');

    setState(() {
      database = db;
    });

    void initState() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        initDb();

        super.initState();
      });
    }
  }

  List<Map> citiesList = [
    {'cityName': 'Warsaw', 'temperature': 20, 'isFav': true},
    {'cityName': 'Sydney', 'temperature': 26, 'isFav': false},
    {'cityName': 'New York', 'temperature': 18, 'isFav': false}
  ];

  bool isFiltered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (() {
                  setState(() {
                    isFiltered = !isFiltered;
                  });
                }),
                icon: const Icon(Icons.star_half))
          ],
          title: const Text('City weather'),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: isFiltered
                ? citiesList.where((city) => city['isFav']).toList().length
                : citiesList.length,
            itemBuilder: ((context, index) {
              Map city = isFiltered
                  ? citiesList.where((city) => city['isFav']).toList()[index]
                  : citiesList[index];

              return ListTile(
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      city['isFav'] = !city['isFav'];
                    });
                  },
                  icon: Icon(Icons.star,
                      color: city['isFav'] ? Colors.orange : Colors.grey),
                ),
                title: Text(city['cityName'] +
                    '' +
                    city['temperature'].toString() +
                    ' °C'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherDetails(
                        weatherInfo: city,
                      ),
                    ),
                  );
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherMgmt(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                                'Czy na pewno chcesz usunąć miasto?'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WeatherAdd(
                            database: database,
                          )));
            }));
  }
}
