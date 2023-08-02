import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool pressClickMe = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color.fromARGB(255, 112, 136, 73),
                  ),
                  child: pressClickMe
                      ? const Text(
                          'A simple text',
                          style: TextStyle(color: Colors.white),
                        )
                      : const Text(
                          'Hello World',
                          style: TextStyle(color: Colors.white),
                        )),
              ElevatedButton(
                onPressed: () => {
                  setState(() {
                    pressClickMe = !pressClickMe;
                  })
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white10),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text(
                  'Click me',
                  style: TextStyle(color: Color.fromARGB(255, 112, 136, 73)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
