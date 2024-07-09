import 'package:flutter/material.dart';
import 'dart:math';


get_temp(temp,val){
  if (val==1){
    String temp_in_celsius= (temp-273.15).toStringAsFixed(2);
    return temp_in_celsius;
  }
  else if(val==2){
    String temp_in_fahren= ((temp*1.8)-459.67).toStringAsFixed(2);
    return temp_in_fahren;
  }
}

get_coord(double long){
  if(long> 0){
    return "N";
  }
}