import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDropDownTextField extends StatelessWidget {
  final Function(dynamic) onChanged;
  const MyDropDownTextField({
    super.key, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:6,
      child: DropDownTextField(
        initialValue: AppLocalizations.of(context)!.back,
        onChanged: onChanged,
        dropDownList: const [
          DropDownValueModel(name: 'Ежедневно', value: 0),
          DropDownValueModel(name: 'Через день', value: 1),
          DropDownValueModel(name: 'Через 2 дня', value: 2),
        ],
        textFieldDecoration: InputDecoration(
            labelText:'Переодичность',
          contentPadding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: Color.fromRGBO(169, 167, 167, 100), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: Color.fromRGBO(169, 167, 167, 100), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: Color.fromRGBO(169, 167, 167, 100), width: 1.5),
          ),
        ),
      ),
    );
  }
}
