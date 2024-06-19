import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<int> containerNumbers = List.generate(10, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal Scrollable Containers'),
        ),
        body: Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: containerNumbers.length,
            itemBuilder: (context, index) {
              return ContainerWidget(
                number: containerNumbers[index],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final int number;

  ContainerWidget({required this.number});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap, move this container to the center
        Scrollable.ensureVisible(
          context,
          alignment: 0.5, // Move to the center of the viewport
          duration: Duration(milliseconds: 500), // Optional: Animation duration
        );
      },
      child: Container(
        width: 80,
        height: 120,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
