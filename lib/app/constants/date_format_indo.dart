import 'dart:convert';

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Sen", "2" : "Sel", "3" : "Rab", "4" : "Kam", "5" : "Jum", "6" : "Sab", "7" : "Ming" }';

  dynamic monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "Mei", "6" : "Jun", "7" : "Jul", "8" : "Agust", "9" : "Sep", "10" : "Okt", "11" : "Nov", "12" : "Des" }';
  var newString =
      date.year.toString().substring(date.year.toString().length - 2);
  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      newString.toString();
}
