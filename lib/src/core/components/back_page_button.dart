import 'package:teya/src/core/resources/colors/pallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackPageButton extends StatelessWidget {
  const BackPageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Pallet.black,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }
}
