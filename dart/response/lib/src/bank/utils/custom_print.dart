void printSuccess(Object text) {
  print('\x1B[32m$text\x1B[0m');
}

void printError(Object text) {
  print('\x1B[31m$text\x1B[0m');
}

void printWarning(Object text) {
  print('\x1B[33m$text\x1B[0m');
}
