import 'package:flutter/material.dart';

class ScreenHelper {
  
  var width;
  var height;
  var blockSizeHorizontal;
  var blockSizeVertical;

  ScreenHelper(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;
  }

}