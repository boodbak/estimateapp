import 'package:estimateapp/Preview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


var items = [
  'Chain',
  'Pustya',
  'Gopi Tadu',
  'Ear Rings',
  'Locket',
  'Mangalsutra chains',
  'Gundlu',
  'Necklace',
  'Finger Rings'
  'Balirings',
   'Matil',
  'Bangles', 'Kadas',
  'Bracelets',
  'Vadiyanam',
];


String kdm = '22kt916',
    nonKdm = '18kt75';

const List<Widget> purity = <Widget>[
  Text('92'),
  Text('89'),
  Text('76'),
  Text('72'),
];


String itemName = items.first;

class GoldPage extends StatefulWidget {
  const GoldPage({super.key});

  @override
  _GoldPageState createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {
  double stoneWeight = 0,
      grossWeight = 0,
      nettWeight = 0,
      va = 0,
      stonePrice = 0,
      goldrate = 0,
      temp = 0;
      


  String purityInWords = kdm;
  bool _purity = true;
  final List<bool> _selectedPurity = <bool>[true, false, false, false];


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
                height: 90,
                color: Colors.amber,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  'JAIN JEWELLERS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,

                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 2),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0),
                        ),
                      ),
                      child: const Text(
                        "Estimate",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
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

                              textInputAction: TextInputAction.next,
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

                                if (value.length < 5){goldrate = double.parse(value + '0');}
                                else{goldrate = double.parse(value);
                                } temp = goldrate;
                                goldrate = (temp * 92) / 100;

                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: const Text(
                              ' /10gms',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 6,
                        bottom: 0,
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Item name:         ',
                                style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: DropdownButton(

                              value: itemName
,                              isExpanded: true,

                              onChanged: (String? value) {
                                itemName = value!; //now check
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
                              'Gross Weight:    ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: TextField(

                              textInputAction: TextInputAction.next,
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
                              'Stone Weight:    ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: TextField(

                              textInputAction: TextInputAction.next,
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
                              'Value Added:     ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: TextField(

                              textInputAction: TextInputAction.next,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                isDense: true,
                                hintText: '0',
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
                              'Stone Price:       ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: TextField(

                              textInputAction: TextInputAction.next,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                isDense: true,
                                hintText: '00.00',
                                suffixText: 'rs.',
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
                              'Purity:   ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              onPressed: (int index) async {
                                setState(() {
                                  // The button that is tapped is set to true, and the others to false.
                                  for (int i = 0; i < _selectedPurity.length; i++) {
                                    _selectedPurity[i] = i == index;
                                    if (index == 0) {
                                      goldrate = (temp * 92/10) / 100;
                                      purityInWords = kdm;

                                      _purity = true;
                                    } else if (index == 1){
                                      goldrate = (temp * 89/10) / 100;
                                      purityInWords = kdm;


                                      _purity = true;
                                    } else if (index == 2){
                                      goldrate = (temp * 76/10) / 100;

                                      _purity = false;
                                      purityInWords = nonKdm;

                                    } else {
                                      goldrate = (temp * 72/10) / 100;
                                      print('18kt');
                                      _purity = false;
                                      purityInWords = nonKdm;
                                      }
                                  }

                                    // if(_purity == true){
                                    //   purityInWords = kdm;
                                    // }
                                    // else{purityInWords = nonKdm;}

                                });

                              },

                              constraints: const BoxConstraints(
                                minHeight: 40.0,
                                minWidth: 64,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              selectedColor: Colors.white,
                              fillColor: Colors.amber,
                              isSelected: _selectedPurity,
                              children: purity,
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(
                      height: 25,
                    ),

                    SizedBox(
                      height:50, //height of button
                      width:350,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green),
                        onPressed: () async {
                          setState(() {
                            nettWeight = grossWeight - stoneWeight;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Preview(
                                  itemName,
                                  grossWeight,
                                  stoneWeight,
                                  goldrate,
                                  nettWeight,
                                  stonePrice,
                                  va,
                                  purityInWords,

                              ),
                            ),
                          );
                        },
                        child: const Text('Calculate'),
                      ),
                    ),

                    SizedBox(
                      height: 10,
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
