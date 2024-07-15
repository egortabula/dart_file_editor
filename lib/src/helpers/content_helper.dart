class ContentHelper {
  /// Splits the content into lines
  static List<String> splitByLines(String content) {
    return content.split('\n');
  }

  /// Join content
  static String joinByLines(List<String> lines) {
    return lines.join('\n');
  }
}
