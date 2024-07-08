import 'package:flutter/material.dart';
import 'package:intl/intl.dart' ;


var now = DateTime.now();
var formatter = DateFormat('dd-MMMM-yyyy');
String formattedDate = formatter.format(now);

get_date(){
  return formattedDate;
}