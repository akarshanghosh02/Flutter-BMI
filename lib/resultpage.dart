import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constant.dart';
import 'reusableCard.dart';
import 'calculateButton.dart';

class ResultPage extends StatelessWidget {
  final String BMICal;
  final String BMItext;
  final String BMIadvice;

  ResultPage({this.BMICal, this.BMItext, this.BMIadvice});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF24292E),
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text("Your Result",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900)),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    BMItext,
                    style: kRResultTextColor,
                  ),
                  Text(
                    BMICal,
                    style: kesultTextcolor,
                  ),
                  Text(
                    BMIadvice,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              decoration: BoxDecoration(
                color: kBottomContainerColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: calculateButton(
                buttonText: "Re-Calculate",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return InputPage();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
