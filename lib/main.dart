import 'package:cep/cep_lisst_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CEP App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: CEPListScreen(),
    );
  }
}
