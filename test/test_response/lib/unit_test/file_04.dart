class File04 {
  final File04Helper helper;

  File04(this.helper);

  int file04() {
    final value = helper.function();
    return value;
  }
}

class File04Helper {
  int function() {
    throw UnimplementedError();
  }
}
