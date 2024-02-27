import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5FDD63),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Today';
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Manage Your Farm',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
          bottom: const TabBar(dividerColor: Colors.transparent, tabs: [
            Tab(text: 'Crops'),
            Tab(text: 'Weather'),
            Tab(text: 'Soil'),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 3,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outlined),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.agriculture_outlined),
              label: 'My Farm',
            ),
          ],
        ),
        body: TabBarView(children: [
          const Center(
            child: Text("Crops Tab"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              //top
              Row(
                children: [
                  const Text(
                    'Weather Updates',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const Spacer(),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: dropdownValue,
                          items: <String>['Today', 'Custom', 'Month']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // setState(() {
                            dropdownValue = newValue!;
                            // });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              //5 widgets
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherContainer(
                      icon: Icons.thermostat,
                      title: 'Temperature',
                      numbers: '27°'),
                  WeatherContainer(
                      icon: Icons.water_drop_outlined,
                      title: 'Humidity',
                      numbers: '65%'),
                  WeatherContainer(
                      icon: Icons.air, title: 'Wind Speed', numbers: '12mph'),
                ],
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherContainer(
                      icon: Icons.speed,
                      title: 'Atm. Pressure',
                      numbers: '1013 mb'),
                  WeatherContainer(
                      icon: Icons.sunny_snowing,
                      title: 'UV Index',
                      numbers: '7'),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              //others
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Others',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 10,
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Text(
                      'Alert & Warnings ',
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Text(
                      'Historical Data',
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Text(
                      'Forecast',
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                  ],
                ),
              )
            ]),
          ),
          const Center(
            child: Text("Soil Tab"),
          ),
        ]),
      ),
    );
  }
}

class WeatherContainer extends StatelessWidget {
  final IconData icon;
  final String title, numbers;
  const WeatherContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.numbers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 105,
        height: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(style: BorderStyle.solid, color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icon
              Icon(
                icon,
                color: Colors.grey[700],
              ),
              //title
              Text(
                title,
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
              //numbers
              Text(numbers)
            ],
          ),
        ),
      ),
    );
  }
}
