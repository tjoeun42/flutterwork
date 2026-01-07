import 'package:flutter/material.dart';

class Homelarge extends StatelessWidget {
  const Homelarge({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            flex: 7,
              child: Container(
                child: Center(
                  child: Text('왼쪽'),
                ),
                color: Colors.amberAccent,
              )
          ),
          Expanded(
            flex: 3,
              child: Container(
                child: Center(
                  child: Text('오른쪽'),
                ),
                color: Colors.lightGreen
              )
          ),
        ],
      )
    );
  }
}
