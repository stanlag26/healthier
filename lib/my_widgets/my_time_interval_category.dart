import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTimeIntervalCategory extends StatelessWidget {
  final int count;
  final String titleText;
  final String subtitleText;
  final VoidCallback onPress;
  const MyTimeIntervalCategory(
      {Key? key,
      required this.count,
      required this.titleText,
      required this.onPress, required this.subtitleText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)),
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
                leading: const Icon(FontAwesomeIcons.fileMedical,size: 30,),
                title: Text(titleText),
                subtitle: Text(subtitleText),
                trailing: IconButton(
                  onPressed: onPress,
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.blue,
                  ),
                )),
          ],
        ));
  }
}
