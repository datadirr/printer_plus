import 'package:flutter/material.dart';
import 'package:printer_plus/printer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _print();
            },
            child: const Text("Print"),
          ),
        ),
      ),
    );
  }

  _print() async {
    await TSCBTPrinter.printText(
      macAddress: "MAC Address",
      content: "datadirr",
    );
    await TSCBTPrinter.printQR(macAddress: "MAC Address", content: "datadirr");
    await TSCBTPrinter.printBarcode(
      macAddress: "MAC Address",
      content: "datadirr",
    );
  }
}
