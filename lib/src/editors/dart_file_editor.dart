import 'package:dart_file_editor/dart_file_editor.dart';

class DartFileEditor {
  /// Adds the specified [contentToAdd] to the specified 
  /// [className] in the content.
  ///
  /// This method splits the [content] into separate lines, finds the end index
  /// of the class with the name [className], and then inserts the [contentToAdd]
  /// just before the closing curly brace of the class.
  ///
  /// Returns the modified content with the added [contentToAdd].
  static String addContentToClass(
    String content, {
    required String className,
    required String contentToAdd,
    // InsertPosition insertPosition = InsertPosition.end, //TODO:
  }) {
    final lines = ContentHelper.splitByLines(content);
    final indexToInsert = IndexHelpers.findClassEndIndex(className, content);
    lines.insert(indexToInsert, '  $contentToAdd');
    final result = ContentHelper.joinByLines(lines);
    return result;
  }

  /// Adds the specified [imports] to the top of the file content.
  ///
  /// This method splits the [content] into separate lines, finds the end index
  /// of existing imports, and then inserts the [imports] at the correct position.
  /// If an import is already present, it won't be added again.
  ///
  /// Returns the modified content with the added [imports].
  static String addImports(
    String content, {
    required List<String> imports,
  }) {
    // Split the content into lines
    final lines = ContentHelper.splitByLines(content);

    // Find the index where existing imports end
    var importEndIndex =
        IndexHelpers.findLastIndexStartsWith(content, startsWith: 'import ');

    // If no imports found, set the index to 0 to add imports at the top
    if (importEndIndex == -1) {
      importEndIndex = 0;
    } else {
      // Move index to the next line after the last import
      importEndIndex += 1;
    }

    // Prepare a set of existing imports to avoid duplicates
    final existingImports =
        lines.where((line) => line.startsWith('import')).toSet();

    // Add new imports if they are not already in the content
    for (final newImport in imports) {
      if (!existingImports.contains(newImport)) {
        lines.insert(importEndIndex, newImport);
        importEndIndex += 1; // Move index for next potential new import
      }
    }

    // Join the lines back into a single string
    return ContentHelper.joinByLines(lines);
  }
}
