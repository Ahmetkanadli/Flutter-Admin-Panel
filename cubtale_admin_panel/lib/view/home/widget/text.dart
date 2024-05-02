import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text (double width,String text,String description){
  return SizedBox(
    width: width < 1350 ? 450/2 : 450/2,
    child:  Row(
      children: [
        Text(text),
        const Spacer(),
        Text(description),
        text == "Name" ? Spacer() : const SizedBox(width: 5,),

        text == "Name" ? Center(): const Icon(Icons.arrow_forward_ios_rounded, size: 10,),
        const SizedBox(width: 10),

      ],
    ),
  );
}