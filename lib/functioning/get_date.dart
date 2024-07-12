
import 'package:intl/intl.dart' ;

var now = DateTime.now();

get_date({required date}){
  var formatter = DateFormat('dd-MMMM-yyyy');
  String formattedDate = formatter.format(now);
  return formattedDate;
}
