import 'package:flutter/material.dart';
import './style.dart' as style;

void main() {
  runApp(
    MaterialApp(
      theme: style.theme,
      home: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Instargram'), actions: [Icon(Icons.star)],),
      body: Column(
        children: [
          Icon(Icons.star),
          Text('안녕 더조은 학원이야')
        ],
      ),
    );
  }
}

