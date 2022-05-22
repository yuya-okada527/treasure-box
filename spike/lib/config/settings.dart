import 'package:flutter_dotenv/flutter_dotenv.dart';

class Settings {
  static String get env {
    return dotenv.env["ENV"] ?? "local";
  }

  static bool get isTest {
    return env == "test";
  }

  static bool get isLocalOrTest {
    return ["local", "test"].contains(env);
  }
}
