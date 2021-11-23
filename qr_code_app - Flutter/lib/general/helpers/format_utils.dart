class FormatUtils {
  static formatRemainingMinutes(int remainingMinutes) {
    String minutes =
        (remainingMinutes ~/ 60).toString().padLeft(2, '0');
    String seconds =
        (remainingMinutes % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
