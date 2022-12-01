import 'package:logger/logger.dart';

/// Globally accessible default [Logger] instance.
/// Used to beautify console output.
final logger = Logger(
  printer: PrettyPrinter(printTime: true),
);
