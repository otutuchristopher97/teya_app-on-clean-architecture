import 'package:teya/src/core/components/texts/custom_text.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final bool isLoading;
  final String label;
  final Color labelColor, buttonColor;
  final double radius, height;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.label,
    this.labelColor = Colors.white,
    this.buttonColor = Pallet.primary,
    this.radius = 8,
    this.height = 40,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          disabledBackgroundColor: buttonColor.withOpacity(0.4),
        ),
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  key: Key("loader"),
                  width: 20,
                  height: 20,
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.white),
                ),
              )
            : CustomText(
                text: label,
                color: labelColor,
                weight: FontWeight.bold,
              ),
      ),
    );
  }
}
