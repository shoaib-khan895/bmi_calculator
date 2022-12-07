import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  String? resulttxt;

  String? bmitxt;

  String? intertxt;

  ResultPage({  this.resulttxt,  this.bmitxt,  this.intertxt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Results'),
          backgroundColor: const Color(0xFF1D1E33),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Your Results',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: const Color(0xFF1D1E33),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(bmitxt!,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w700)),
                      Text(resulttxt!,
                          style: TextStyle(
                              fontSize: 70, fontWeight: FontWeight.w500)),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(intertxt!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.normal,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, '/');
              }),
              child: Container(
                color: Colors.pink,
                width: double.infinity,
                height: 80,
                child: Center(
                    child: Text(
                  'Re-Calculated ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ));
  }
}
