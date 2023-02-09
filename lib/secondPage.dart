import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String itemName;
  final double grossWeight;
  final double stoneWeight;
  const SecondPage(this.itemName, this.grossWeight, this.stoneWeight,
      {super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    double netweight = widget.grossWeight - widget.stoneWeight;
    double rate =5400;
    double valuead = 12;
    double price = rate*netweight+valuead/100;
    return Scaffold(
        body: SafeArea(
          child: Column(
              children: [
          Text('itemName: ${widget.itemName}'),
          Text(widget.grossWeight.toString()),
          Text(widget.stoneWeight.toString()),
          Text(netweight.toStringAsPrecision(4)),
              ],
            ),
        ));
  }
}

