import 'package:bmi_calculator/tools/recyclable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../tools/base_button.dart';

class AnswersFile extends StatelessWidget {
  AnswersFile(
      {required this.actualResult,
      required this.actualBMIResult,
      required this.meaning});

  final String actualResult;
  final String actualBMIResult;
  final String meaning;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RecyclableCard(
              shade: kActualShade,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    actualResult.toUpperCase(),
                    style: kActualResult,
                  ),
                  Text(
                    actualBMIResult,
                    style: kActualBMIResult,
                  ),
                  Text(
                    meaning,
                    textAlign: TextAlign.center,
                    style: kBMIRemark,
                  ),
                ],
              ),
            ),
          ),
          BaseButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonLabel: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}