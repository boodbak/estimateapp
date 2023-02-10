import 'package:estimateapp/Preview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];
String dropDownValue = items.first;

class GoldPage extends StatefulWidget {
  const GoldPage({super.key});

  @override
  _GoldPageState createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {
  double stoneWeight = 0,
      grossWeight = 0,
      netWeight = 0,
      va = 0,
      stonePrice = 0,
      goldrate = 0,
      temp = 0;
  String itemName = 'empty';
  bool light = true;

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 70,
                color: Colors.redAccent.shade700,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5.0),
                child: const Text(
                  'JAIN JEWELLERS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 3),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0),
                        ),
                      ),
                      child: const Text(
                        "Estimate",
                        style: TextStyle(fontSize: 32),
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
                          const Text('Date: ', style: TextStyle(fontSize: 16)),
                          Text(
                            DateFormat('dd/MM/yyyy').format(DateTime.now()),
                            style: const TextStyle(fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Column(
                              children: const [
                                Text('Rate: ', style: TextStyle(fontSize: 16)),
                                Text(
                                  '  24kt ',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: InputDecoration(
                                isDense: true, // Added this
                                contentPadding: const EdgeInsets.all(9),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onChanged: (value) {
                                goldrate = double.parse(value);
                                temp = goldrate;
                                goldrate = (temp * 92) / 100;
                              },
                            ),
                          ),
                          const Text(
                            ' /10gms',
                            style: TextStyle(fontSize: 16),
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Item name:',
                                style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: DropdownButton(
                              value: dropDownValue,
                              isExpanded: true,
                              hint: const Text('Select Item Type'),
                              onChanged: (String? value) {
                                dropDownValue = value!;
                                itemName = value;
                                setState(() {});
                              },
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Gross Weight:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Stone Weight:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                isDense: true,
                                hintText: '00.00',
                                suffixText: 'gms',
                                contentPadding: EdgeInsets.all(5),
                              ),
                              onChanged: (value) {
                                stoneWeight = double.parse(value);
                                setState(() {
                                  netWeight = grossWeight - stoneWeight;
                                });
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
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Nett Weight:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                isDense: true,
                                hintText: '00.00',
                                suffixText: 'gms',
                                contentPadding: EdgeInsets.all(5),
                              ),
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Value Added:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                isDense: true,
                                hintText: '00',
                                suffixText: '%',
                                contentPadding: EdgeInsets.all(5),
                              ),
                              onChanged: ((value) {
                                va = double.parse(value);
                              }),
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Stone Price:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                isDense: true,
                                hintText: '00.00',
                                suffixText: 'Rs',
                                contentPadding: EdgeInsets.all(5),
                              ),
                              onChanged: (value) {
                                stonePrice = double.parse(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('750 Non KDM'),
                        Switch(
                          value: light,
                          activeColor: Colors.amber,
                          activeTrackColor: Colors.blue,
                          onChanged: (bool value) {
                            setState(() {
                              light = value;
                              if (light) {
                                print(goldrate);
                                goldrate = (temp * 92) / 100;
                                print('kdm rate $goldrate');
                                print('kdm');
                              } else {
                                goldrate = (temp * 75) / 100;
                                print('non kdm rate $goldrate');
                                print('non kdm');
                              }
                            });
                          },
                        ),
                        const Text('916 KDM'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Preview(
                                itemName,
                                grossWeight,
                                stoneWeight,
                                goldrate,
                                netWeight,
                                stonePrice,
                                va),
                          ),
                        );
                      },
                      child: const Text('Preview'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
