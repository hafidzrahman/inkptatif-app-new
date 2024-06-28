import 'package:flutter/material.dart';
import 'package:inkptatif/global.dart';

class MySecondButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color backgroundBtn;
  final bool isLoading;

  const MySecondButton(
      {super.key,
      this.onTap,
      required this.text,
      required this.backgroundBtn,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          color: isLoading ? backgroundBtn.withOpacity(.95) : backgroundBtn,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: customWhite.withOpacity(.5),
                      strokeWidth: 2.0,
                    ),
                  ),
                )
              : Text(
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
