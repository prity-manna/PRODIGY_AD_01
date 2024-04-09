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
  bool isDecimalEntered = false;

  void _onTapButton(String number) async {
    if ((_text.trim() == "" && await ButtonFunctions.isOperator(number)) || (_text.trim() != "" && await ButtonFunctions.isOperator(_text[_text.length - 1]) && await ButtonFunctions.isOperator(number))) {
      return;
    }
    if (!isDecimalEntered && await ButtonFunctions.isDecimal(number)) {
      _text += "0";
      isDecimalEntered = true;
    } else if (isDecimalEntered && await ButtonFunctions.isDecimal(number)) {
      return;
    } else if (!isDecimalEntered && await ButtonFunctions.isDecimal(number)) {
      isDecimalEntered = true;
    } else if (await ButtonFunctions.isOperator(number)) {
      isDecimalEntered = false;
    }
    setState(() => _text += number);
  }

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
              color: Colors.grey.shade200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  _text,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                ),
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
                    onTapActivity: (text) {
                      isDecimalEntered = false;
                      setState(() => _text = "");
                    }
                  ),
                  CustomButton(
                    buttonText: "Del",
                    onTapActivity: (text) => setState(() {
                      isDecimalEntered = false;
                      if (_text.isNotEmpty) _text = _text.substring(0, _text.length - 1);
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
                  onTapActivity: (text) => _onTapButton(text),
                ),
                CustomButton(
                  buttonText: "-",
                  onTapActivity: (text) => _onTapButton(text),
                ),
                CustomButton(
                  buttonText: "x",
                  onTapActivity: (text) => _onTapButton(text),
                ),
                CustomButton(
                  buttonText: "/",
                  onTapActivity: (text) => _onTapButton(text),
                ),
                CustomButton(
                    buttonText: "9",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                    buttonText: "8",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                    buttonText: "7",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                    buttonText: "6",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                    buttonText: "5",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                    buttonText: "4",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                    buttonText: "3",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                    buttonText: "2",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                    buttonText: "1",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                    buttonText: "0",
                    onTapActivity: (text) => _onTapButton(text)),
                CustomButton(
                  buttonText: ".",
                  onTapActivity: (text) => _onTapButton(text),
                ),
                CustomButton(
                  buttonText: "=",
                  onTapActivity: (text) async {
                    isDecimalEntered = false;
                    Object? result = await ButtonFunctions.onCalculation(_text);
                    if (result == null) return;
                    if (!mounted) return;
                    setState(() => _text = result.toString());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
