import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final int? maxLines;
  final Color? color;
  final FontWeight? weight;
  final bool isUnderlined;
  final VoidCallback? onTap;
  final bool isCentered;
  final TextStyle? style;
  final TextOverflow? overflow;

  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.maxLines,
    this.isUnderlined = false,
    this.onTap,
    this.isCentered = false,
    this.style,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        maxLines: maxLines ?? 1,
        textAlign: isCentered ? TextAlign.center : TextAlign.left,
        overflow: overflow ?? TextOverflow.visible,
        style: style ??
            GoogleFonts.workSans(
                fontSize: size,
                fontWeight: weight ?? FontWeight.normal,
                color: color ?? Pallet.black,
                decoration: isUnderlined
                    ? TextDecoration.underline
                    : TextDecoration.none),
      ),
    );
  }
}
