Duration calculateTimeDifference(String timestamp) {
  DateTime currentTime = DateTime.now();
  DateTime inputTime = DateTime.parse(timestamp);

  Duration difference = currentTime.difference(inputTime);

  return difference;
}

String formatDuration(String timestamp) {
  Duration duration = calculateTimeDifference(timestamp);
  if (duration.inDays > 0) {
    return '${duration.inDays}d ago';
  } else if (duration.inHours > 0) {
    return '${duration.inHours}h ago';
  } else if (duration.inMinutes > 0) {
    return '${duration.inMinutes}m ago';
  } else {
    return '${duration.inSeconds}s ago';
  }
}
