import 'package:teya/src/core/components/texts/custom_text.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';
import 'package:teya/src/modules/onboarding/data/model/language.dart';
import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  final Language language;
  final VoidCallback? onCardTap;
  const LanguageCard({
    Key? key,
    required this.language,
    required this.onCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Card(
          color: Pallet.white,
          elevation: 0,
          shadowColor: Colors.grey.withOpacity(0.2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(language.logoUrl),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomText(
                          key: const Key("label"),
                          text: language.englishName,
                          color: Pallet.blackNeutral,
                        ),
                      ],
                    ),
                    language.isCurrent
                        ? const Icon(Icons.check)
                        : const SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
