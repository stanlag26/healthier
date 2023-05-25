import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDropDownTextField extends StatelessWidget {
  final Function(dynamic) onChanged;
  final String initialValue;
  const MyDropDownTextField({
    super.key, required this.onChanged, required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:6,
      child: DropDownTextField(
        initialValue: initialValue,
        onChanged: onChanged,
        dropDownList:  [
          DropDownValueModel(name: AppLocalizations.of(context)!.daily, value: 0),
          DropDownValueModel(name: AppLocalizations.of(context)!.in_one_day, value: 1),
          DropDownValueModel(name: AppLocalizations.of(context)!.in_two_days, value: 2),
        ],
        textFieldDecoration: InputDecoration(
            labelText:AppLocalizations.of(context)!.periodicity,
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
