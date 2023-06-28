class File05 {
  final File05Helper helper;

  File05(this.helper);

  int file05(int value) {
    final response = helper.function(HelperParam(value));
    return response;
  }
}

class File05Helper {
  int function(HelperParam param) {
    throw UnimplementedError();
  }
}

class HelperParam {
  final int value;

  HelperParam(this.value);
}
