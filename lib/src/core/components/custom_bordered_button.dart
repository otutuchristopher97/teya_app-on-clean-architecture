import 'package:teya/src/core/components/texts/custom_text.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';
import 'package:flutter/material.dart';

class CustomBorderedButton extends StatelessWidget {
  final bool isLoading;
  final String label;
  final Color labelColor, borderColor;
  final double radius, height;
  final VoidCallback? onPressed;

  const CustomBorderedButton({
    Key? key,
    required this.label,
    this.labelColor = Pallet.black,
    this.borderColor = Pallet.black,
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
          border: Border.all(color: borderColor, width: 1)),
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
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
              ),
      ),
    );
  }
}
