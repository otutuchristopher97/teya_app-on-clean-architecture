import 'package:flutter/material.dart';
import 'package:teya/src/core/components/texts/custom_text.dart';

import 'package:teya/src/core/resources/colors/pallet.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? initialValue, hintText;
  final Widget? icon;
  final Color iconColor;
  final bool? obscureText;

  final bool enabled, enableBorder;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final void Function(String?)? onSaved, onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? iconPressed;
  final int? minLines;

  const CustomTextFormField(
      {Key? key,
      this.labelText,
      this.icon,
      this.iconColor = Pallet.blackNeutral,
      this.obscureText = false,
      this.enableBorder = true,
      this.initialValue,
      this.enabled = true,
      this.hintText,
      this.iconPressed,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.onSaved,
      this.onChanged,
      this.minLines,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // key:key,
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomText(
                    text: labelText!,
                  ),
                )
              : const SizedBox(
                  height: 0,
                ),
          Container(
              // height: 50,
              decoration: BoxDecoration(
                color: Pallet.white,
                borderRadius: BorderRadius.circular(
                  8,
                ),
                border: Border.all(
                  color: Pallet.white,
                ),
              ),
              child: icon != null
                  ? Center(
                      child: TextFormField(
                        controller: controller,
                        onSaved: onSaved,
                        initialValue: initialValue,
                        validator: validator,
                        enabled: enabled,
                        keyboardType: keyboardType,
                        cursorColor: Pallet.primary,
                        minLines: minLines,
                        maxLines: 1,
                        obscureText: obscureText!,
                        onChanged: onChanged,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: icon!,
                            key: const Key("prefixIcon"),
                            onPressed: iconPressed,
                            color: iconColor,
                            padding: const EdgeInsets.only(right: 0),
                          ),
                          fillColor: Pallet.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: enableBorder
                                  ? const Color(0xffCCCCCC)
                                  : Pallet.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Pallet.primary,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: enableBorder
                                  ? const Color(0xffCCCCCC)
                                  : Pallet.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: Pallet.blackNeutral,
                          ),
                          hintText: hintText,
                          contentPadding:
                              const EdgeInsets.only(left: 5, top: 15),
                          prefix: const Padding(
                              padding: EdgeInsets.only(left: 0.0)),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: enableBorder
                                  ? const Color(0xffCCCCCC)
                                  : Pallet.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),

                          // errorBorder: InputBorder.none,

                          // focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    )
                  : Center(
                      child: TextFormField(
                        controller: controller,
                        onSaved: onSaved,
                        initialValue: initialValue,
                        validator: validator,
                        enabled: enabled,
                        keyboardType: keyboardType,
                        cursorColor: Pallet.primary,
                        minLines: minLines,
                        maxLines: 1,
                        obscureText: obscureText!,
                        onChanged: onChanged,
                        decoration: InputDecoration(
                          fillColor: Pallet.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: enableBorder
                                  ? const Color(0xffCCCCCC)
                                  : Pallet.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Pallet.primary,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: enableBorder
                                  ? const Color(0xffCCCCCC)
                                  : Pallet.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: Pallet.blackNeutral,
                          ),
                          hintText: hintText,
                          contentPadding:
                              const EdgeInsets.only(left: 5, top: 15),
                          prefix: const Padding(
                              padding: EdgeInsets.only(left: 0.0)),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: enableBorder
                                  ? const Color(0xffCCCCCC)
                                  : Pallet.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),

                          // errorBorder: InputBorder.none,

                          // focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ))
        ],
      ),
    );
  }
}
