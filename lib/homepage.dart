import 'dart:ffi';

import 'package:estimateapp/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double stoneWeight = 0, grossWeight = 0;
  String itemName = 'empty';

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              color: Colors.redAccent.shade700,
              child: Text('JAIN JEWELLERS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold)),
              alignment: Alignment.center,
              padding: EdgeInsets.all(5.0),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 3),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0))),
                    child: Text(
                      "Estimate",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      children: [
                        Text('Date: ', style: const TextStyle(fontSize: 16)),
                        Text(
                          DateFormat('dd/MM/yyyy').format(DateTime.now()),
                          style: const TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Column(
                            children: [
                              Text('Rate: ',
                                  style: const TextStyle(fontSize: 16)),
                              Text('  24kt ',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                            child: TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            isDense: true, // Added this
                            contentPadding: EdgeInsets.all(9),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )),
                        Text(
                          ' /10gms',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                    ),
                    child: Row(
                      children: [
                        Text('Item name:         ',
                            style: TextStyle(fontSize: 16)),
                        Expanded(
                          child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                isDense: true,
                                contentPadding: EdgeInsets.all(5),
                              ),
                              onChanged: (value) {
                                itemName = value;
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                    ),
                    child: Row(
                      children: [
                        Text('Gross weight:     ',
                            style: const TextStyle(fontSize: 16)),
                        Expanded(
                          child: TextField(
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              isDense: true,
                              hintText: '00.00',
                              suffixText: 'gms',
                              contentPadding: EdgeInsets.all(5),
                            ),
                            onChanged: (value) {
                              grossWeight = double.parse(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                    ),
                    child: Row(
                      children: [
                        Text('Stone weight:     ',
                            style: const TextStyle(fontSize: 16)),
                        Expanded(
                          child: TextField(
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              isDense: true,
                              hintText: '00.00',
                              suffixText: 'gms',
                              contentPadding: EdgeInsets.all(5),
                            ),
                            onChanged: (value) {
                              stoneWeight = double.parse(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondPage(
                                    itemName, grossWeight, stoneWeight)));
                      },
                      child: const Text('Next')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
