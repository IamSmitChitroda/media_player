extension StringExtensions on String {
  String get formatTime {
    if (!contains(':')) {
      return '${substring(0, 1)}.${substring(1)}';
    } else {
      return this;
    }
  }
}
