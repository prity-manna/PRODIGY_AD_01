import 'package:calculator/components/buttonComponent/custom_button.dart';
import 'package:calculator/services/calculator_button_functions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20.0),
              color: Colors.blue,
              child: Text(
                _text,
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    buttonText: "C",
                    onTapActivity: (text) => setState(() {
                      _text = "";
                    }),
                  ),
                  CustomButton(
                    buttonText: "Del",
                    onTapActivity: (text) => setState(() {
                      if (_text.isNotEmpty) {
                        _text = _text.substring(0, _text.length - 1);
                      }
                    }),
                  ),
                ],
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runSpacing: 10,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              spacing: 10,
              children: [
                CustomButton(
                  buttonText: "+",
                  onTapActivity: (text) => null,
                ),
                CustomButton(
                  buttonText: "-",
                  onTapActivity: (text) => null,
                ),
                CustomButton(
                  buttonText: "x",
                  onTapActivity: (text) => null,
                ),
                CustomButton(
                  buttonText: "/",
                  onTapActivity: (text) => null,
                ),
                CustomButton(
                    buttonText: "9",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                    buttonText: "8",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                    buttonText: "7",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                    buttonText: "6",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                    buttonText: "5",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                    buttonText: "4",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                    buttonText: "3",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                    buttonText: "2",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                    buttonText: "1",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                    buttonText: "0",
                    onTapActivity: (text) => {
                          ButtonFunctions.onTapNumber(text),
                          setState(() {
                            _text += text;
                          })
                        }),
                CustomButton(
                  buttonText: ".",
                  onTapActivity: (text) => null,
                ),
                CustomButton(
                  buttonText: "=",
                  onTapActivity: (text) => null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
