import 'dart:io';

import 'package:ngen/generator/name_builder.dart';

class ComponentGenerator {
  final String name;
  final NameBuilder builder;

  ComponentGenerator(this.name) : builder = NameBuilder(name);

  void generate() async {
    final directory = new Directory(name);
    await directory.create();
    createFile(directory, SCSS_TEMPLATE, "scss");
    createFile(directory, DART_TEMPLATE, "dart");
    createFile(directory, HTML_TEMPLATE, "html");
  }

  void createFile(final Directory directory, final String template, final String type) {
    var contents = template;
    contents = contents.replaceAll("\$className", builder.className());
    contents = contents.replaceAll("\$tagName", builder.tagName());
    contents = contents.replaceAll("\$fileName", builder.fileName());
    contents = contents.replaceAll("\$name", name);

    final newFile = new File("${directory.path}/${builder.fileName()}.$type");
    newFile.writeAsStringSync(contents);
  }
}

const DART_TEMPLATE = """
import 'package:angular/angular.dart';

/// [\$className] 
///
/// Example Usage:
/// ```html
/// <\$tagName></\$tagName>
/// ```
///
@Component(
  selector: '\$tagName',
  styleUrls: ['\$fileName.css'],
  templateUrl: '\$fileName.html',
  directives: [],
)
class \$className {

}
""";

const HTML_TEMPLATE = """
<h1>\$className lives!</h1>
""";

const SCSS_TEMPLATE = """
:host {
    /* This styles the enclosing div */
}
""";