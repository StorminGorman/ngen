import 'package:args/command_runner.dart';
import 'package:ngen/generator/component_generator.dart';

class CreateComponentCommand extends Command {
  @override
  String get description => "Creates a new Angular Component";

  @override
  String get name => "component";

  CreateComponentCommand();

  @override
  void run() {
    if(this.argResults.arguments.isEmpty) {
      printUsage();
    } else {
      final generator = ComponentGenerator(this.argResults.arguments[0]);
      generator.generate();
    }
  }
}