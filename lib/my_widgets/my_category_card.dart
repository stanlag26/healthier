import 'package:flutter/material.dart';

class MyCategoryCard extends StatelessWidget {
  final String name;
  final String photo;
  final VoidCallback onPress;

  const MyCategoryCard({
    Key? key,
    required this.name,
    required this.photo,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onPress,
        child: Stack(alignment: Alignment.center, children: [
          Center(
            child: Container(
                margin: const EdgeInsets.only(
                    left: 20, top: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.asset(
                        photo,
                        height: 130,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ))),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
