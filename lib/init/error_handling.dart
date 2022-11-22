import 'package:color_gen_app/utils/app_logger.dart';
import 'package:flutter/foundation.dart';

void initializeErrorHandling() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      logger.d(details);
    }
  };

  // unhandled errors handler
  PlatformDispatcher.instance.onError = (error, stack) {
    if (kDebugMode) {
      logger.d("Error: $error\nStacktrace: $stack");
    }

    return true;
  };
}
