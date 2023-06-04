import 'package:flutter/material.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';

// ignore: must_be_immutable
class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 12 : 10,
      width: isActive ? 15 : 7,
      decoration: BoxDecoration(
        color: isActive ? Pallet.primary : Pallet.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(isActive ? 12 : 8),
      ),
    );
  }
}
