import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  late final String _buttonText;
  late final Function(String text) onTapActivity;
  CustomButton(
      {super.key, required String buttonText, required this.onTapActivity}) {
    _buttonText = buttonText;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapActivity(_buttonText),
      child: Container(
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .05,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          _buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
