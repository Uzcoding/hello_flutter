import 'package:flutter/cupertino.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showPayBottomSheet(context);
        },
        child: const Icon(Icons.open_in_browser),
      ),
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

  Future<dynamic> showPayBottomSheet(
    BuildContext context,
  ) {
    const textStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Color(0xFF27214D),
    );

    final inputDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color(0xFFF3F1F1),
      hintText: '10th avenue, Lekki, Lagos State',
    );
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 470.0,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              CupertinoButton(
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                child: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFF070648),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 406.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 40.0,
                ).copyWith(bottom: 44.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Delivery address',
                      style: textStyle,
                    ),
                    const SizedBox(height: 16.0),
                    TextField(decoration: inputDecoration),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Number we can call',
                      style: textStyle,
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration.copyWith(
                        hintText: '09090605708',
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BottomSheetButton(
                          onPressed: () {},
                        ),
                        BottomSheetButton(
                          text: 'Pay with card',
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    Key? key,
    this.text = 'Pay on delivery',
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(16.0),
        side: const BorderSide(
          color: Color(0xFFFFA451),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFA451),
        ),
      ),
    );
  }
}
