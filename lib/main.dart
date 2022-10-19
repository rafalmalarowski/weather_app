import 'package:flutter/material.dart';
import 'package:weather_app/views/home.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String databsesPath = await getDatabasesPath();
  print(databsesPath);
  final db = await openDatabase(join(await getDatabasesPath(), DB_NAME),
      version: 1, onCreate: (Database db, int version) async {
    print('DB has been succesfully created');
    await db.execute(
        'CREATE TABLE cities (id INTEGER PRIMARY KEY, city_name TEXT, is_fav INTEGER);');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
