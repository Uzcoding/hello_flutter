import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedScreenIndex = 0;

  final screens = [
    Container(color: Colors.amber),
    Container(color: Colors.green),
  ];

  void onTapPage(int index) {
    _selectedScreenIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => onTapPage(index),
        currentIndex: _selectedScreenIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            activeIcon: Icon(Icons.favorite_border),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            activeIcon: Icon(Icons.access_time_filled),
            label: 'Second',
          ),
        ],
      ),
    );
  }
}
