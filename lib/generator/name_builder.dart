class NameBuilder {
  final String name;
  NameBuilder(this.name);

  String className() {
    final parts = name.split("_");
    String capitalize(String value) {
      return "${value.substring(0, 1).toUpperCase()}${value.substring(1)}";
    }
    var prefix = "";
    if(parts.length > 1) {
      prefix = parts.reduce((first, second) => "${capitalize(first)}${capitalize(second)}");
    } else {
      prefix = capitalize(parts[0]);
    }
    return "${prefix}Component";
  }

  String fileName() {
    return "${name}_component";
  }

  String tagName() {
    return name.replaceAll("_", "-");
  }
}