import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateConverter {
  static DateTime dateUtc = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);

  static String getConvetDate(String date1) {
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

  static String getDate(index) {
    return dateUtc.add(Duration(days: index)).day.toString() +
        "/" +
        dateUtc.add(Duration(days: index)).month.toString();
  }

  static String getDay1(index) {
    return dateUtc.add(Duration(days: index)).day.toString();
  }

  static String getPeriod(String time) {
    String time1 = time.split("-").first;
    String time2 = time.split("-").last;

    if (int.parse(time1) >= 12) {
      time1 = int.parse(time1) == 12
          ? time1 + AppStrings.pm.tr
          : (int.parse(time1) - 12).toString() + AppStrings.pm.tr;
    } else {
      time1 = time1 + AppStrings.am.tr;
    }
    if (int.parse(time2) >= 12) {
      time2 = int.parse(time2) == 12
          ? time2 + AppStrings.pm.tr
          : (int.parse(time2) - 12).toString() + AppStrings.pm.tr;
    } else {
      time2 = time2 + AppStrings.am.tr;
    }
    return time2 + " - " + time1;
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS')
        .parse(dateTime, true)
        .toLocal();
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }

  static String deliveryDateAndTimeToDate(
      String deliveryDate, String deliveryTime) {
    DateTime _date = DateFormat('yyyy-MM-dd').parse(deliveryDate);
    DateTime _time = DateFormat('HH:mm').parse(deliveryTime);
    return '${DateFormat('dd-MMM-yyyy').format(_date)} ${DateFormat('hh:mm a').format(_time)}';
  }
}
