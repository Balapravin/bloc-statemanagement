import 'dart:developer';

class Helper {
  final int isProduction = 0;

  void logger(String message) {
    if (isProduction == 1) {
      // --- No Actions ---
    } else {
      print(message);
    }
  }
}

final helper = Helper();
