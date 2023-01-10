import 'package:flutter/material.dart';

import '../constants/fonts.dart';
import '../constants/pallete.dart';

class InputDropdown extends StatelessWidget {
  const InputDropdown(
      {required this.value,
      required this.list,
      required this.onChange,
      required this.hintText,
      Key? key})
      : super(key: key);
  final String value;
  final String hintText;

  final String? Function(String? value) onChange;
  final List<Map<String, String>> list;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value.toString() == "" ? null : value.toString(),
      isExpanded: true,
      decoration: InputDecoration(
          fillColor: Palette.white,
          contentPadding:
              EdgeInsets.only(left: 22, bottom: 20, top: 15, right: 10),
          isDense: true,
          filled: true,
          hintText: hintText,
          errorMaxLines: 1,
          errorStyle: FontBody.s12.copyWith(color: Palette.secondary),
          hintStyle: FontBody.p15.copyWith(color: Palette.gray),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Palette.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Palette.outline, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Palette.secondary, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Palette.secondary, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Palette.outline, width: 1),
          )),
      items: list
          .map(
            (e) => DropdownMenuItem(
              value: e["id"],
              child: Text(e["name"] ?? "name",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: FontBody.p15.copyWith(color: Palette.black)),
            ),
          )
          .toList(),
      onChanged: onChange,
    );
  }
}
