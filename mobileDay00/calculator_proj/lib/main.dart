import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentFormula = '0';
  num result = 0;

  void _updateFormula(String num) {
    setState(() {
      switch (num) {
        case '=':
          result = currentFormula.replaceAll('x', '*').interpret();
        case 'AC':
          currentFormula = '0';
          result = 0;
        case 'C':
          if (currentFormula.length > 1) {
            currentFormula =
                currentFormula.substring(0, currentFormula.length - 1);
          } else {
            currentFormula = '0';
          }
        case '0':
          if (currentFormula == '0' &&
              (int.parse(num) <= 1 && int.parse(num) <= 9)) {
            currentFormula = num;
          } else if (currentFormula == '0' && num == '0') {
            return;
          } else {
            currentFormula = '$currentFormula$num';
          }
        default:
          if (currentFormula == '0') {
            currentFormula = num;
          } else {
            currentFormula = '$currentFormula$num';
          }
      }
    });
  }

  Expanded customButton(
    String text,
    Color color,
  ) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          _updateFormula(text);
        },
        style: TextButton.styleFrom(
          foregroundColor: color,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 118, 154, 182),
                ),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          currentFormula,
                          style: const TextStyle(fontSize: 24),
                        ),
                        Text(
                          result.toString(),
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 76, 105, 129),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customButton('7', Colors.black),
                          customButton('8', Colors.black),
                          customButton('9', Colors.black),
                          customButton('C', Colors.red),
                          customButton('AC', Colors.red),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customButton('4', Colors.black),
                          customButton('5', Colors.black),
                          customButton('6', Colors.black),
                          customButton('+', Colors.white),
                          customButton('-', Colors.white),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customButton('1', Colors.black),
                          customButton('2', Colors.black),
                          customButton('3', Colors.black),
                          customButton('x', Colors.white),
                          customButton('/', Colors.white),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customButton('0', Colors.black),
                          customButton('.', Colors.black),
                          customButton('00', Colors.black),
                          customButton('=', Colors.white),
                          Expanded(
                            child: TextButton(
                              onPressed: null,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                              child: const Text(
                                '',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
