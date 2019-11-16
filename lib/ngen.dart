import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:ngen/commands/create_command.dart';

class NGen {
  final List<String> arguments;

  NGen(this.arguments);

  void execute() {
    CommandRunner("ngen", "Generates Angular Dart")
      ..addCommand(new CreateCommand())
      ..run(this.arguments);
  }
}

