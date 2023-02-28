import 'package:estimateapp/goldPage.dart';
import 'package:estimateapp/silverPage.dart';
import 'package:estimateapp/simpleInterestPage.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
           Container (child:
           Padding(
             padding: const EdgeInsets.only(top:35, bottom: 30),
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Image.asset('assets/Logo-white.png', scale: 3,),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     'JAIN JEWELLERS',
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 25,

                         fontFamily: 'Lato',
                         fontWeight: FontWeight.bold),
                   ),
                 ),
               ],
             ),
           ),
             width: double.infinity,
             decoration: BoxDecoration(
               color: const Color(0xff353535),
               borderRadius: BorderRadius.only(
                   bottomRight: Radius.circular(55.0),
                   bottomLeft: Radius.circular(55.0)),
             ),
           ),

            Padding(padding: const EdgeInsets.only(top:40),),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Estimate', style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold),),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const GoldPage()),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 75),
                      backgroundColor: Colors.amber,
                      textStyle: const TextStyle(fontSize: 26),
                    ),
                    child: const Text('Gold'),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const SilverPage()),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 75),
                      backgroundColor: Colors.blue,
                      textStyle: const TextStyle(fontSize: 26),
                    ),
                    child: const Text('Silver'),
                  ),
                )
              ],
            ),

            Padding(padding: const EdgeInsets.only(top:40),),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Interest Calculator', style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print('to be updated');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const SimpleInterestPage()),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 75),
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(fontSize: 26),
                ),
                child: const Text('Simple Interest'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
