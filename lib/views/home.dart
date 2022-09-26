import 'package:flutter/material.dart';
import 'package:weather_app/views/weather_details.dart';
import 'package:weather_app/views/weather_mgmt.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> citiesList = [
    {'cityName': 'Warsaw', 'temperature': 20},
    {'cityName': 'Sydney', 'temperature': 26},
    {'cityName': 'New York', 'temperature': 18}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City weather'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: citiesList.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star),
              ),
              title: Text(citiesList[index]['cityName'] +
                  '' +
                  citiesList[index]['temperature'].toString() +
                  ' °C'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherDetails(
                      weatherInfo: citiesList[index],
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
                          title:
                              const Text('Czy na pewno chcesz usunąć miasto?'),
                          content: const Text('AlertDialog description'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
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
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    );
  }
}
