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
            const SizedBox(
              height: 10,
            ),
            Text(
              this.weatherInfo['cityName'],
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
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
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey,
                  ),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                'Pressure',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '1014hPa',
                                style:
                                    TextStyle(fontSize: 22, color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                'Wind',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                '50 km/h',
                                style:
                                    TextStyle(fontSize: 22, color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                'Pressure',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '1014hPa',
                                style:
                                    TextStyle(fontSize: 22, color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                'Wind',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                '50 km/h',
                                style:
                                    TextStyle(fontSize: 22, color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
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
