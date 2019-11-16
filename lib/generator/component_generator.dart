import 'dart:io';

import 'package:ngen/generator/name_builder.dart';

class ComponentGenerator {
  final String name;
  final NameBuilder builder;

  ComponentGenerator(this.name) : builder = NameBuilder(name);

  void generate() async {
    final directory = new Directory(name);
    await directory.create();
    final scriptFile = new File(Platform.script.toFilePath());
    final packagePath = scriptFile.parent.parent.path;
    final scss = new File("$packagePath/lib/templates/component.scss-template");
    final dart = new File("$packagePath/lib/templates/component.dart-template");
    final html = new File("$packagePath/lib/templates/component.html-template");
    createFile(directory, scss, "scss");
    createFile(directory, dart, "dart");
    createFile(directory, html, "html");
  }

  void createFile(final Directory directory, final File template, final String type) {
    var contents = template.readAsStringSync();
    contents = contents.replaceAll("\$className", builder.className());
    contents = contents.replaceAll("\$tagName", builder.tagName());
    contents = contents.replaceAll("\$fileName", builder.fileName());
    contents = contents.replaceAll("\$name", name);

    final newFile = new File("${directory.path}/${builder.fileName()}.$type");
    newFile.writeAsStringSync(contents);
  }
}