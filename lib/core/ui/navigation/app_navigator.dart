import '../commands/app_commands.dart';

class NavigationCommand {
  static Future<void> push(String route, {Object? args}) {
    return AppCommands.navigatorKey.currentState!.pushNamed(
      route,
      arguments: args,
    );
  }

  static void pop() {
    AppCommands.navigatorKey.currentState!.pop();
  }

  static void pushAndClear(String route) {
    AppCommands.navigatorKey.currentState!.pushNamedAndRemoveUntil(
      route,
      (_) => false,
    );
  }
}
