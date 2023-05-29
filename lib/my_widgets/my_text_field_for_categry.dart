import 'package:flutter/material.dart';



class MyTextFieldCategory extends StatelessWidget {
  final String labelText;
  TextInputType textType;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTab;
  final TextEditingController textEditingController;


  MyTextFieldCategory({
    Key? key,
    required this.labelText,
    this.textType = TextInputType.text,
    this.onChanged,
    required this.readOnly,
    this.onTab, required this.textEditingController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:10),
      child: TextField(
        controller: textEditingController,
        onTap: onTab,
        readOnly: readOnly,
        onChanged: onChanged,
        keyboardType: textType,
        cursorHeight: 20,
        autofocus: true,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color.fromRGBO(169, 167, 167, 100), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color.fromRGBO(169, 167, 167, 100), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color.fromRGBO(169, 167, 167, 100), width: 1.5),
          ),
        ),
      ),

    );
  }
}


