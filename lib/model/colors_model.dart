import 'dart:ui';

import 'package:flutter/material.dart';

class Colors{
  String colorA;
  String colorB;


  Colors({required this.colorA,required this.colorB});

  factory Colors.fromJson(Map<String,dynamic>json){
    return Colors(colorA:json ["color_a"] ?? "#3DD14A", colorB:json ["color_b"] ?? "#ECD416");
  }
  // "color_a": "#3DD14A",
  // "color_b": "#ECD416



  Map<String, dynamic> toJson(){
    return {
      colorA:colorA,
      colorB:colorB,
    };
  }

}

