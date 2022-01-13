import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {},
              // isThreeLine: true,
              title: const Text("FIrst Tile"),
              subtitle: Text("two "),

              leading: const Icon(Icons.print),
            )
          ],
        ),
      ),
    );
  }
}
