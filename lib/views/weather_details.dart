import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  final Map weatherInfo;
  const WeatherDetails({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text(this.weatherInfo['cityName']),
            // Text('Sunday, 1 AM'),
            Column(
              children: [
                Image.network('http://openweathermap.org/img/wn/10d@2x.png'),
                Text('${this.weatherInfo['temperature']} °'),
                // const Text('Heavy Rain'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
