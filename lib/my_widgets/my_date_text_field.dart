import 'package:flutter/material.dart';


class MyTextFieldDate extends StatelessWidget {
  final String hintTextField;
  final VoidCallback onTab;
  final ValueChanged<String>? onChanged;
  final TextEditingController textEditingController;

  const MyTextFieldDate(
      {Key? key, required this.hintTextField, required this.onTab, required this.textEditingController, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
        child: TextField(
          readOnly: true,
      controller: textEditingController,
      onTap: onTab,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: hintTextField,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              BorderSide(color: Color.fromRGBO(169, 167, 167, 100), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              BorderSide(color: Color.fromRGBO(169, 167, 167, 100), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderRadius: BorderRadius.circular(15),
          borderSide:
              BorderSide(color: Color.fromRGBO(169, 167, 167, 100), width: 1.5),
        ),
      ),
    ));
  }
}
