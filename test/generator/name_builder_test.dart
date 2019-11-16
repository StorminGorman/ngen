
import 'package:ngen/generator/name_builder.dart';
import 'package:test/test.dart';

void main() {
  test("file name prefix", () {
    final builder = NameBuilder("some_name_for");
    expect(builder.fileName(), "some_name_for_component");
  });

  test("class name", () {
    final builder = NameBuilder("some_name_for");
    expect(builder.className(), "SomeNameForComponent");
  });

  test("single word", () {
    final builder = NameBuilder("word");
    expect(builder.className(), "WordComponent");
    expect(builder.tagName(), "word");
    expect(builder.fileName(), "word_component");
  });

  test("tag name", () {
    final builder = NameBuilder("some_name_for");
    expect(builder.tagName(), "some-name-for");
  });
}