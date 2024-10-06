import 'dart:developer';

extension Log on Object? {
  void printInfo({
    String tag = '',
  }) {
    log('$this', name: tag);
  }

  void printError({
    String tag = 'ERROR LOG',
  }) {
    log('$this', name: tag);
  }
}
