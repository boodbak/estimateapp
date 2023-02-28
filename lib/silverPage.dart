import 'package:estimateapp/silverpreview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


var items = [
  'Payal',
  'Mettal',
  'Rings',
  'Plate',
  'Deepam',
  'Murti',
  'Kada',
  'Flowers',
  'Keychains',
  'Molatadu',

];


String
        seventy = '70',
        eighty = '80',
        eightyfive = '85',
        ninetytwo = '92.5',
        pure = '99.9';



const List<Widget> purity = <Widget>[
  Text('70'),
  Text('80'),
  Text('85'),
  Text('92.5'),
  Text('99.9'),
];


String itemName = items.first;

class SilverPage extends StatefulWidget {
  const SilverPage({super.key});

  @override
  _SilverPageState createState() => _SilverPageState();
}

class _SilverPageState extends State<SilverPage> {
  double
      weight = 0,
      mc = 0,
      stonePrice = 0,
      rate = 0,
      temp = 0;



  String purityInWords = seventy;
  final List<bool> _selectedPurity = <bool>[true, false, false, false, false];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 90,
                color: Colors.blue,
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
                                  '  999 ',
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
                                if (value.length < 3){rate = double.parse(value + '0');}
                                  else{rate = double.parse(value);
                                     }
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
                            child: Text('Item name:     ',
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
                              'Weight:            ',
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
                                weight = double.parse(value);
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
                              'MC:                  ',
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
                                prefixText: 'Rs.',
                                suffixText: '/gm',
                                contentPadding: EdgeInsets.all(5),
                              ),
                              onChanged: ((value) {
                                mc = double.parse(value);
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
                              'Stone Price:   ',
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
                                prefixText: 'Rs.',
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
                                      purityInWords = seventy;
                                    } else if (index == 1){
                                      purityInWords = eighty;
                                    } else if (index == 2){
                                      purityInWords = eightyfive;
                                    }
                                    else if (index == 3){
                                      purityInWords = ninetytwo;
                                    }
                                    else {
                                      purityInWords = pure;
                                    }
                                  }

                                });

                              },

                              constraints: const BoxConstraints(
                                minHeight: 40.0,
                                minWidth: 50,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              selectedColor: Colors.white,
                              fillColor: Colors.blue,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SilverPreview(
                                itemName,
                                weight,
                                rate,
                                stonePrice,
                                mc,
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
