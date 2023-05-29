import 'package:flutter/material.dart';

import '../const/const.dart';

class MyCategoryCard extends StatelessWidget {
  final String name;
  final String indications;
  final String upperlower;
  final String data;
  final String photo;
  final VoidCallback onPress;

  const MyCategoryCard({
    Key? key,
    required this.name,
    required this.indications,
    this.upperlower = '',
    required this.data,
    required this.photo,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 150,
          margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
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
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5,left: 25, top: 10),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: MyTextStyle.textStyle15,
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        indications,
                        style: MyTextStyle.textStyle25Bold,
                      ),
                      upperlower != ''?Text(
                        upperlower,
                        style: MyTextStyle.textStyle10,
                      ): Container(),
                      const SizedBox(height: 10,),
                      Text(
                          'Добавить',
                          style: TextStyle(fontSize: 16,color: Colors.blue)
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        data,
                        style: MyTextStyle.textStyle10,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Opacity(
                    opacity: 0.9,
                    child: Image.asset(
                      photo,
                      height: 130,
                      width: 130,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
