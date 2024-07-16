// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:dart_file_editor/dart_file_editor.dart';
import 'package:test/test.dart';

import '../contents/app_pages.dart';

void main() {
  group(
    'DartFileEditor',
    () {
      test(
        'Add line to simple list',
        () async {
          final content = await File('test/contents/list.dart').readAsString();
          final expected =
              await File('test/contents/list_expected.dart').readAsString();

          const contentToAdd = '4';

          final res = DartFileEditor.addElementToList(
            content,
            listName: 'final list = [',
            elementToAdd: contentToAdd,
          );
          expect(res, expected);
        },
      );
      test(
        'Add multi line to simple list',
        () async {
          final content = await File('test/contents/list.dart').readAsString();

          const contentToAdd = '''
GetPage(
    name: _Paths.home,
    page: () => const HomeView(),
    binding: HomeBinding(),
  )''';

          final res = DartFileEditor.addElementToList(
            content,
            listName: 'final list = [',
            elementToAdd: contentToAdd,
          );

          const matcher = '''
final list = [
  1,
  2,
  3,
  GetPage(
    name: _Paths.home,
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
];
''';

          expect(res, matcher);
        },
      );
    },
  );
  test(
    'Add item to list inside class',
    () {
      const content = appPagesContent;

      final res = DartFileEditor.addElementToList(
        content,
        listName: 'static final routes = [',
        elementToAdd: getPageElement,
      );

      expect(res, appPagesContentExpected);
    },
  );
}
