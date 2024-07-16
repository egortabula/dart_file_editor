import 'package:dart_file_editor/dart_file_editor.dart';

class IndexHelpers {
  /// Finds the last index of a line that contains the specified [element].
  ///
  /// This method splits the [content] into separate lines and then searches
  /// for the last line that contains the specified [element].
  ///
  /// Returns the index of the last line that contains the [element].
  static int findLastIndexOf(String content, {required String element}) {
    final lines = ContentHelper.splitByLines(content);
    return lines.lastIndexWhere((val) => val.contains(element));
  }

  /// Finds the last index of a line that contains the specified [element].
  ///
  /// This method splits the [content] into separate lines and then searches
  /// for the last line that contains the specified [element].
  ///
  /// Returns the index of the last line that contains the [element].
  static int findIndexOf(String content, {required String element}) {
    final lines = ContentHelper.splitByLines(content);
    return lines.indexWhere((val) => val.contains(element));
  }

  /// Finds the last index of a line that exactly
  /// matches the specified [element].
  ///
  /// This method splits the [content] into separate lines and then searches
  /// for the last line that exactly matches the specified [element].
  ///
  /// Returns the index of the last line that exactly matches the [element].
  static int findLastIndexMatching(String content, String element) {
    final lines = ContentHelper.splitByLines(content);
    return lines.lastIndexWhere((val) => val.trim() == element);
  }

  /// Finds the last index of a line that starts
  /// with the specified [startsWith] string.
  ///
  /// This method splits the [content] into separate lines and then searches
  /// for the last line that starts with the specified [startsWith] string.
  ///
  /// Returns the index of the last line that starts
  /// with the [startsWith] string.
  static int findLastIndexStartsWith(
    String content, {
    required String startsWith,
  }) {
    final lines = ContentHelper.splitByLines(content);
    return lines.lastIndexWhere((val) => val.startsWith(startsWith));
  }

  /// Finds the starting index of the specified class in the content.
  ///
  /// This method splits the [content] into separate lines and then searches
  /// for the line that contains the definition of the class
  /// with the name [className].
  ///
  /// Returns the index of the line where the class definition starts.
  static int findClassStartIndex(String className, String content) {
    // Split [content] into separate lines
    final lines = ContentHelper.splitByLines(content);

    final regex = RegExp(
      r'\bclass\s+' +
          className +
          r'(\s*<.*?>\s*)?(\s+extends\s+\w+)?(\s+with\s+\w+)?(\s+implements\s+\w+)?\s*\{',
    );

    // Find the index of the line that matches the class definition
    for (var i = 0; i < lines.length; i++) {
      if (regex.hasMatch(lines[i])) {
        return i;
      }
    }

    throw Exception('Class $className not found in the content.');
  }

  /// Finds the ending index of the specified class in the content.
  ///
  /// This method splits the [content] into separate lines, finds the starting
  /// index of the class with the name [className], and then searches for the
  /// line that contains only a closing curly brace '}' to determine where the
  /// class definition ends.
  ///
  /// Returns the index of the line where the class definition ends.
  static int findClassEndIndex(String className, String content) {
    // Split the file content into lines
    final lines = ContentHelper.splitByLines(content);

    // Find the start index of the class
    final startIndex = findClassStartIndex(className, content);

    // Create a sublist of lines starting from the class start index
    final sublist = lines.sublist(startIndex);

    // Find the index of the line containing only the closing curly brace
    final endClassIndex = sublist.indexWhere((val) => val.trim() == '}');

    // Return the final index of the closing curly brace
    return startIndex + endClassIndex;
  }

  /// Finds the index of the line containing [line]
  static int findLineIndex(
    String content, {
    required String line,
  }) {
    // Split the file content into lines
    final lines = ContentHelper.splitByLines(content);

    final lineIndex = lines.indexWhere((val) => val.contains(line));

    return lineIndex;
  }
}
