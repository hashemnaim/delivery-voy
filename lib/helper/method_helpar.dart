

String getConvetDate(
  String date1,
) {
  final date = DateTime.parse(date1);
  final date2 = DateTime.now();
  final days = (date2.difference(date).inDays / 30).round();
  final hours = (date2.difference(date).inHours / 24).round();
  final minutes = (date2.difference(date).inMinutes / 60).round();
  String date3 = "";
  if (days > 2) {
    date3 = "منذ ${days.toString()} شهور";
  } else if (hours > 1) {
    date3 = "منذ ${hours.toString()} يوم";
  } else if (minutes > 3) {
    date3 = "منذ ${minutes.toString()} دقائق";
  } else {
    date3 = "منذ لحظات";
  }
  return date3;
}

DateTime dateUtc =
    DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day);

String getDate(index) {
  return dateUtc.add(Duration(days: index)).day.toString() +
      "/" +
      dateUtc.add(Duration(days: index)).month.toString();
}

String getDay1(index) {
  return dateUtc.add(Duration(days: index)).day.toString();
}

String getPeriod(String time) {
  String time1 = time.split("-").first;
  String time2 = time.split("-").last;

  if (int.parse(time1) >= 12) {
    time1 = int.parse(time1) == 12
        ? time1 + "ض"
        : (int.parse(time1) - 12).toString() + "م";
  } else {
    time1 = time1 + "ص";
  }
  if (int.parse(time2) >= 12) {
    time2 = int.parse(time2) == 12
        ? time2 + "ض"
        : (int.parse(time2) - 12).toString() + "م";
  } else {
    time2 = time2 + "ص";
  }
  return time2 + " - " + time1;
}
