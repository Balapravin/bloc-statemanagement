import 'dart:developer';

class Helper {
  final int isProduction = 0;

  void logger(String message) {
    if (isProduction == 1) {
      // --- No Actions ---
    } else {
      log(message);
    }
  }
}

final helper = Helper();
