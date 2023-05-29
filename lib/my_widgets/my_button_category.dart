
import 'package:flutter/material.dart';

class MyButtonCategory extends StatelessWidget {
  final Text myText ;
  final VoidCallback onPress;
   const MyButtonCategory({
    Key? key,
    required this.myText, required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      margin: const EdgeInsets.only(top:10),
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
        ),
        child: myText,
      ),
    );
  }
}


