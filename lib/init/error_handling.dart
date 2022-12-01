import 'package:color_gen_app/utils/app_logger.dart';
import 'package:flutter/foundation.dart';

/// Initialization of any runtime error handlers. Outputs logs using
/// [logger] instance.
void initializeErrorHandling() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      logger.d(details);
    }
  };

  // Other non Flutter unhandled errors handler
  PlatformDispatcher.instance.onError = (error, stack) {
    if (kDebugMode) {
      logger.d("Error: $error\nStacktrace: $stack");
    }

    return true;
  };
}
