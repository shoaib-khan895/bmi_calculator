import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'icons.dart';

const Color DeActiveCard = Color(0xFF1D1E33);
const Color activeCard = Colors.deepPurple;
bool selectedMale = false;
bool selectedFemale = false;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 140;
  int weight = 80;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1E33),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // updateButton(gender: 1);
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReuseContainer(
                    cardChild: ReuseIcon(
                      text: 'MALE',
                      disIcon: Icons.man,
                    ),
                    color: selectedGender == Gender.male
                        ? activeCard
                        : DeActiveCard,
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // updateButton(gender: 2);
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReuseContainer(
                    cardChild: ReuseIcon(
                      text: 'FEMALE',
                      disIcon: Icons.woman_sharp,
                    ),
                    color: selectedGender == Gender.female
                        ? activeCard
                        : DeActiveCard,
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReuseContainer(
            color: DeActiveCard,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text('HEIGHT'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  height.toString(),
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                ),
                Slider(
                  activeColor: activeCard,
                  inactiveColor: Colors.white,
                  min: 0,
                  max: 220,
                  value: height.toDouble(),
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReuseContainer(
                  color: DeActiveCard,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("WEIGHT",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20)),
                      Text(weight.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 36)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: activeCard,
                            child: Icon(Icons.exposure_minus_1,
                                color: Colors.white),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            backgroundColor: activeCard,
                            child: Icon(Icons.plus_one, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReuseContainer(
                  color: DeActiveCard,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("AGE",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20)),
                      Text(age.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 36)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: activeCard,
                            child: Icon(
                              Icons.exposure_minus_1,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            backgroundColor: activeCard,
                            child: Icon(Icons.plus_one, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: (() {
              BmiBrain calc = BmiBrain(height: height, weight: weight);
              // Navigator.pushNamed(context, '/ResultsPage');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    resulttxt: calc.getResults(),
                    bmitxt: calc.calculateBMI(),
                    intertxt: calc.getInterpretation(),
                  ),
                ),
              );
            }),
            child: Container(
              color: Colors.pink,
              width: double.infinity,
              height: 80,
              child: Center(
                  child: Text(
                'Calculated ',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
