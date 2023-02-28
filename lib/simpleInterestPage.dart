import 'package:estimateapp/simpleInterestPreview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';


const List<Widget> purity = <Widget>[
  Text('2'),
  Text('2.5'),
  Text('3'),
  Text('4'),
];



class SimpleInterestPage extends StatefulWidget {
  const SimpleInterestPage({super.key});

  @override
  _SimpleInterestPageState createState() => _SimpleInterestPageState();
}

class _SimpleInterestPageState extends State<SimpleInterestPage> {
  int
      numberOfMonths = 0,
      monthsInterestPaid = 0,
      pa = 0,
      numberOfDays =0,
      amountPaid = 0,
      remainingMonths = 0,
      interestAmount = 0,
      hundred = 100;


  double rateOfInterest = 0;

  final List<bool> _selectedPurity = <bool>[true, false, false, false];
  DateTime date = DateTime.now();
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "Select a date"; //set the initial value of text field
    super.initState();
  }

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
                color: Colors.green,
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
                        "Interest Calculator",
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
                         padding: const EdgeInsets.only(bottom: 30),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:40),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Date:',
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                  Text(DateFormat('dd/MM/yyyy').format(DateTime.now()), style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),


                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left:30.0),
                                child: Column(
                                  children: [
                                    Row(
                                            children: [
                                              Text('Bill Date:',
                                                  style: TextStyle(fontSize: 16)),
                                              IconButton(onPressed: () async {
                                                DateTime? pickedDate = await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2019),
                                                    //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2024));

                                                if (pickedDate != null) {
                                                  print(pickedDate);
                                                  String formattedDate =
                                                  DateFormat('dd/MM/yyyy').format(pickedDate);
                                                  print(
                                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                                  setState(() {
                                                    dateInput.text =
                                                        formattedDate;
                                                    Duration diff = DateTime.now().difference(pickedDate);
                                                    // ignore: division_optimization
                                                    int diffMonths = (diff.inDays / 30).toInt();
                                                    int tempDays = (diff.inDays);
                                                    print(diffMonths);
                                                    //this is working
                                                    numberOfMonths = diffMonths;
                                                    numberOfDays =  tempDays - (diffMonths * 30);
                                                  });
                                                } else {}
                                              },
                                                icon: Icon(Icons.edit, size: 20,),),



                                      ],
                                    ),
                                    Text('${dateInput.text}' , style: TextStyle(fontSize: 18)),
                                  ],
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
                              'Principal Amount:  ',
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
                                contentPadding: EdgeInsets.all(5),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  pa = int.parse(value);
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
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Rate of Interest:     ',
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
                                      rateOfInterest = 2;
                                    } else if (index == 1){
                                      rateOfInterest = 2.5;
                                    } else if (index == 2){
                                      rateOfInterest = 3;}
                                    else{
                                      rateOfInterest = 4;
                                    }
                                  }
                                });
                              },
                              constraints: const BoxConstraints(
                                minHeight: 40.0,
                                minWidth: 49,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              selectedColor: Colors.white,
                              fillColor: Colors.green,
                              isSelected: _selectedPurity,
                              children: purity,
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
                              'No.of Months : ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text('${numberOfMonths.toString()} ${numberOfDays.toString()}'),
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
                              'Months Interest Paid:',
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
                                contentPadding: EdgeInsets.all(5),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  monthsInterestPaid = int.parse(value);
                                  remainingMonths = numberOfMonths - monthsInterestPaid;
                                 //not working  interestAmount =  (pa * rateofinterest )/100 * remainingMonths;
                                 // total amount = pa + interestAmount - amountPaid

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
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Pending Months : ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text('${remainingMonths.toString()}'),
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
                              'Amount Paid:  ',
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
                                contentPadding: EdgeInsets.all(5),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  amountPaid = int.parse(value);
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
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Interest Amount: ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(''),
                        ],
                      ),
                    ),


                    SizedBox(
                      height: 25,
                    ),

                    SizedBox(
                      height:50, //height of button
                      width:350,

                      /*child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SimpleInterestPreview(

                              ),
                            ),
                          );
                        },
                        child: const Text('Calculate'),
                      ),*/
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
