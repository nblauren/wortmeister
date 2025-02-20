import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeService {
  bool isSameDay(DateTime? date1, DateTime date2) {
    if (date1 == null) {
      return false;
    }
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool isAfterTime(DateTime date1, DateTime date2) {
    if (date1.hour > date2.hour) return true;
    if (date1.hour < date2.hour) return false;
    if (date1.minute > date2.minute) return true;
    if (date1.minute < date2.minute) return false;
    return date1.second > date2.second;
  }

  bool isSameTime(DateTime date1, DateTime date2) {
    return date1.hour == date2.hour &&
        date1.minute == date2.minute &&
        date1.second == date2.second;
  }

  String formatDateTimeRange(DateTimeRange dateTimeRange,
      {String format = 'EEE, MMM dd, yyyy'}) {
    final String formattedStartDate = formatDate(dateTimeRange.start, format);
    final String formattedEndDate =
        isSameDay(dateTimeRange.start, dateTimeRange.end)
            ? formatTimeOfDay(TimeOfDay.fromDateTime(dateTimeRange.end))
            : formatDate(dateTimeRange.end, format);
    return '$formattedStartDate - $formattedEndDate';
  }

  String formatDate(DateTime dateTime, String format) {
    final String formattedDate = DateFormat(format).format(dateTime);
    return formattedDate;
  }

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final hours = timeOfDay.hour.toString().padLeft(2, '0');
    final minutes = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  bool isNextDay(DateTime date1, DateTime date2) {
    final DateTime nextDay = DateTime(date2.year, date2.month, date2.day + 1);
    return date1.year == nextDay.year &&
        date1.month == nextDay.month &&
        date1.day == nextDay.day;
  }

  String getCurrentDate() {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return formattedDate;
  }

  String getCurrentTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = DateFormat('HH:mm:ss').format(now);
    return formattedTime;
  }

  String formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String formatFullDateDisplay(DateTime date) {
    return DateFormat('EEE, MMM dd, yyyy').format(date);
  }

  List<DateTime> generateDays(int days) {
    final List<DateTime> dates = [];
    final DateTime today = DateTime.now();

    for (int i = 0; i < days; i++) {
      final DateTime date = DateTime(today.year, today.month, today.day + i);
      dates.add(date);
    }

    return dates;
  }

  DateTime getBeginningOfDay(DateTime date) {
    return DateTime.utc(date.year, date.month, date.day);
  }

  DateTime getEndOfDay(DateTime date) {
    final DateTime endOfDay =
        DateTime.utc(date.year, date.month, date.day, 23, 59, 59);
    return endOfDay;
  }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
