import 'dart:io';

void cleanTerminal() {
  print(Process.runSync("clear", [], runInShell: true).stdout);
}
