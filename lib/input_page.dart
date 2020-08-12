import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconDart.dart';
import 'reusableCard.dart';
import 'constant.dart';
import 'calculateButton.dart';
import 'resultpage.dart';
import 'bmiCalculation.dart';

enum Gender {
  male,
  female,
}

enum ButtonAction {
  plus,
  minus,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  ButtonAction action;

  int weight = kDefaultWeight;
  int age = kDefaultAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: (selectedGender == Gender.male)
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childWidget: IconContent(FontAwesomeIcons.mars, "Male"),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: (selectedGender == Gender.female)
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childWidget:
                          IconContent(FontAwesomeIcons.venus, "Female"),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Color(kColorCode),
                childWidget: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        kHeight,
                        style: kIconstyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: Text(
                              kDefaultHeight.toString(),
                              style: kTextstyle,
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              kCM,
                              style: kIconstyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kInactiveSliderColor,
                        thumbColor: kActiveSliderColor,
                        overlayColor: kActiveSliderColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                      child: Slider(
                        max: 220,
                        min: 120,
                        value: kDefaultHeight.toDouble(),
                        onChanged: (double newHeight) {
                          setState(() {
                            kDefaultHeight = newHeight.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: Color(kColorCode),
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            kWeight,
                            style: kIconstyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            weight.toString(),
                            style: kTextstyle,
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: buildFloatingActionButton(
                                      FontAwesomeIcons.plus, "plus", kWeight),
                                ),
                                Expanded(
                                  child: buildFloatingActionButton(
                                      FontAwesomeIcons.minus, "minus", kWeight),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Color(kColorCode),
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            kAge,
                            style: kIconstyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            age.toString(),
                            style: kTextstyle,
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: buildFloatingActionButton(
                                      FontAwesomeIcons.plus, "plus", kAge),
                                ),
                                Expanded(
                                  child: buildFloatingActionButton(
                                      FontAwesomeIcons.minus, "minus", kAge),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                decoration: BoxDecoration(
                  color: kBottomContainerColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: calculateButton(
                  buttonText: "Calculate",
                  onPressed: () {
                    CalculatorBrain cal =
                        CalculatorBrain(kDefaultWeight, kDefaultHeight);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultPage(
                            BMICal: cal.calculation(),
                            BMItext: cal.bmiText(),
                            BMIadvice: cal.bmiAdvice(),
                          );
                        },
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  FlatButton buildFloatingActionButton(
      IconData icon, String action, String widgetCall) {
    return FlatButton(
      onPressed: () {
        // ignore: unrelated_type_equality_checks
        setState(() {
          if (widgetCall == kWeight) {
            if (action == "plus") {
              weight++;
              kDefaultWeight = weight;
            } else {
              weight--;
              kDefaultWeight = weight;
            }
          } else {
            if (action == "plus") {
              age++;
            } else {
              age--;
            }
          }
        });
      },
      child: Container(
        child: Icon(
          icon,
          size: 40,
        ),
      ),
    );
  }
}
