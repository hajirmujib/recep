import 'package:flutter/material.dart';

import '../constants/fonts.dart';
import '../constants/pallete.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool isNumber;
  final bool isAlamat;
  final bool isNIK;
  final bool enable;
  final Widget prefix;
  final Widget suffix;

  final bool obscure;

  final double radius;
  final String? Function(String? value) validator;
  final String? Function(String? value) onChange;

  InputField({
    this.enable = true,
    required this.controller,
    required this.hintText,
    required this.onChange,
    this.obscure = false,
    this.prefix = const Visibility(
        visible: false,
        child: SizedBox(
          width: 0,
          height: 0,
        )),
    this.suffix = const Visibility(
        visible: false,
        child: SizedBox(
          width: 0,
          height: 0,
        )),
    this.radius = 32,
    this.isNumber = false,
    this.isAlamat = false,
    required this.validator,
    this.isNIK = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: obscure,
        textAlignVertical: TextAlignVertical.center,
        enabled: enable,
        textCapitalization: TextCapitalization.none,
        maxLines: isAlamat ? 5 : 1,
        cursorColor: Colors.black,
        controller: controller,
        style: FontBody.p15.copyWith(color: Palette.black),
        keyboardType: isNumber
            ? TextInputType.number
            : isAlamat
                ? TextInputType.multiline
                : TextInputType.text,
        validator: validator,
        onChanged: onChange,
        decoration: InputDecoration(
            // prefixIconConstraints: BoxConstraints(minWidth: 60, maxHeight: 60),
            prefixIcon: prefix,
            suffixIcon: suffix,
            fillColor: Palette.white,
            contentPadding:
                EdgeInsets.only(left: 20, bottom: 20, top: 20, right: 10),
            isDense: true,
            filled: true,
            hintText: hintText,
            errorMaxLines: 1,
            errorStyle: FontBody.s12.copyWith(color: Palette.secondary),
            hintStyle: FontBody.p15.copyWith(color: Palette.gray),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Palette.primary, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Palette.outline, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Palette.secondary, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Palette.secondary, width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Palette.outline, width: 1),
            )),
        textInputAction:
            isAlamat ? TextInputAction.newline : TextInputAction.next,
      ),
    );
  }
}
