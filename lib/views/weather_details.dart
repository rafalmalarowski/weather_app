import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  final Map weatherInfo;
  const WeatherDetails({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(this.weatherInfo['cityName']),
            // Text('Sunday, 1 AM'),
            Column(
              children: [
                const SizedBox(height: 40),
                Image.network('http://openweathermap.org/img/wn/10d@2x.png'),
                Text('${this.weatherInfo['temperature']}°',
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text(
                  'Partly Cloudy',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                const SizedBox(height: 100),
                Container(
                  margin: const EdgeInsets.all(10),
                  color: Colors.grey[100],
                ),

                // const Text('Heavy Rain'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
