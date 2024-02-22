dynamic today = DateTime.now();
dynamic daytoday = DateTime.now().day;
dynamic monthtoday = DateTime.now().month;
dynamic yeartoday = DateTime.now().year;
dynamic firstdate = DateTime.utc(2010, 10, 16);
dynamic lastdate = DateTime.utc(2030, 10, 16);

int getDaysDifference() {
  // final int alldayslength =firstdate.difference(lastdate).inDays;
  final int oneyearlength = today
      .difference(
        today.add(Duration(days: 10)),
      )
      .inDays;
  return oneyearlength.abs();
}

String getMonths() {
  String thismonth = "";
  if (monthtoday == 1) {
    thismonth = "Jan";
  } else if (monthtoday == 2) {
    thismonth = "Feb";
  } else if (monthtoday == 3) {
    thismonth = "Mar";
  } else if (monthtoday == 4) {
    thismonth = "Apr";
  } else if (monthtoday == 5) {
    thismonth = "May";
  } else if (monthtoday == 6) {
    thismonth = "Jun";
  } else if (monthtoday == 7) {
    thismonth = "July";
  } else if (monthtoday == 8) {
    thismonth = "Aug";
  } else if (monthtoday == 9) {
    thismonth = "Sept";
  } else if (monthtoday == 10) {
    thismonth = "Oct";
  } else if (monthtoday == 11) {
    thismonth = "Nov";
  } else if (monthtoday == 12) {
    thismonth = "Dec";
  }
  return thismonth;
}
