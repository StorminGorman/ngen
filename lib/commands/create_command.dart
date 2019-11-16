import 'package:args/command_runner.dart';
import 'package:ngen/commands/create_component_command.dart';

class CreateCommand extends Command {
  @override
  String get description => "Creates something Angular";

  @override
  String get name => "create";

  CreateCommand() {
    this.addSubcommand(new CreateComponentCommand());
  }
}