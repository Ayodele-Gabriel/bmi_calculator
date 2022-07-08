import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculating_bmi.dart';
import '../constants.dart';
import '../tools/base_button.dart';
import '../tools/icon_view.dart';
import '../tools/recyclable_card.dart';
import '../tools/round_button.dart';
import 'answers_file.dart';

enum Gender {
  male,
  female,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Gender? sex;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RecyclableCard(
                    shade: sex == Gender.male ? kActualShade : kInactualShade,
                    cardChild:
                        IconView(icon: FontAwesomeIcons.mars, gender: "MALE"),
                    onSelect: () {
                      setState(() {
                        sex = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RecyclableCard(
                    shade: sex == Gender.female ? kActualShade : kInactualShade,
                    cardChild: IconView(
                        icon: FontAwesomeIcons.venus, gender: "FEMALE"),
                    onSelect: () {
                      setState(() {
                        sex = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RecyclableCard(
              shade: kActualShade,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kGenderTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kWeightTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kGenderTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double freshInput) {
                        setState(() {
                          height = freshInput.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RecyclableCard(
                    shade: kActualShade,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kGenderTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kWeightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onTouch: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onTouch: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RecyclableCard(
                    shade: kActualShade,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kGenderTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kWeightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onTouch: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onTouch: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BaseButton(
            buttonLabel: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnswersFile(
                    actualResult: calc.result(),
                    actualBMIResult: calc.calculateBMI(),
                    meaning: calc.meaning(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}