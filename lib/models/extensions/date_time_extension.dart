extension HourMinute on DateTime {
  String getHourMinute() {
    var input = toUtc();
    var hour = input.hour;
    var minute = input.minute;
    return '$hour:$minute';
  }
}
