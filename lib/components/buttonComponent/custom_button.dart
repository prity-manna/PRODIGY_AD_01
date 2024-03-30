import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  late final String _buttonText;
  final Function(String text) onTapActivity;
  CustomButton({super.key, required String buttonText, required this.onTapActivity}) {
    _buttonText = buttonText;
  }

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward();
        widget.onTapActivity(widget._buttonText);
      },
      onTapDown: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
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
            widget._buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}