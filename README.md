# Dart File Editor

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

A Dart package for parsing and editing Dart files, providing utilities to modify file content and manage code structure.

## Motivation

I often work with file generation and need to edit file content. For convenience, this package was created to help make changes to Dart files easily and quickly.

## Features

- ✨ Add content to specific classes.
- 📦 Add import statements to the top of the file.
- 🔍 Find indices of class definitions and other elements within the file.
- 🛠 Modular structure for easier maintenance and readability.

## Installation

Add `dart_file_editor` to your `pubspec.yaml`:

```yaml
dependencies:
  dart_file_editor: ^0.0.1
```
Then run flutter pub get to install the package.

## Usage

### Adding Content to a Class

Use DartFileEditor.addContentToClass to add content to a specific class in a Dart file:

```dart
import 'package:dart_file_editor/dart_file_editor.dart';

void main() {
  String content = '''
  class MyClass {
    // existing content
  }
  ''';

  String updatedContent = DartFileEditor.addContentToClass(
    content,
    className: 'MyClass',
    contentToAdd: 'int newField;',
  );

  print(updatedContent);
}
```

### Adding Import Statements

Use DartFileEditor.addImports to add import statements at the top of a Dart file:
```dart
import 'package:dart_file_editor/dart_file_editor.dart';

void main() {
  String content = '''
  import 'package:existing/package.dart';

  void main() {
    // code
  }
  ''';

  String updatedContent = DartFileEditor.addImports(
    content,
    imports: [
      "import 'package:new/package1.dart';",
      "import 'package:new/package2.dart';",
    ],
  );

  print(updatedContent);
}
```

### Finding Indices

Use IndexHelpers to find various indices in the Dart file content:

```dart
import 'package:dart_file_editor/dart_file_editor.dart';

void main() {
  String content = '''
  class MyClass {
    // existing content
  }

  class AnotherClass {
    // other content
  }
  ''';

  int classStartIndex = IndexHelpers.findClassStartIndex('MyClass', content);
  print('Class start index: $classStartIndex');

  int classEndIndex = IndexHelpers.findClassEndIndex('MyClass', content);
  print('Class end index: $classEndIndex');
}
```
## Documentation

### DartFileEditor
| Method | Description |
| ------ | ------ |
| addContentToClass | Adds the specified content to the specified class in the file content. |
| addImports | Adds the specified import statements to the top of the file content. |

### IndexHelpers
| Method | Description |
| ------ | ------ |
| findClassStartIndex | Finds the starting index of the specified class in the file content. |
| findClassEndIndex | Finds the ending index of the specified class in the file content. |
| findLastIndexContaining | Finds the last index of a line that contains the specified element (substring). |
| findLastIndexMatching | Finds the last index of a line that exactly matches the specified element. |
| findLastIndexStartsWith | Finds the last index of a line that starts with the specified element. |

## Contributing

Contributions are welcome! Please open an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

[dart_install_link]: https://dart.dev/get-dart
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
