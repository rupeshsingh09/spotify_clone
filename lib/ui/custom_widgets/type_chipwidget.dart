import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeChipWidget extends StatelessWidget {
  final String typeName;

  TypeChipWidget({required this.typeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 11),
      padding: EdgeInsets.symmetric(horizontal: 11.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.grey,
          width: 0.5
        )
      ),
      child: Center(
        child: Text("$typeName",style: TextStyle(color: Colors.grey,fontSize: 14),),
      ),
    );
  }
}
