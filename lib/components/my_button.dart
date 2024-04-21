import 'package:flutter/material.dart';
import 'package:inkptatif/global.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color backgroundBtn;

  const MyButton({
    super.key,
    this.onTap,
    required this.text,
    required this.backgroundBtn,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: backgroundBtn,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: customWhite,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
