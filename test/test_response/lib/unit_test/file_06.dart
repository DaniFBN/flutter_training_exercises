class File06 {
  final File06Helper helper;

  File06(this.helper);

  int file06(int value) {
    final response = helper.function(param: HelperParam(value));
    return response;
  }
}

class File06Helper {
  int function({required HelperParam param}) {
    throw UnimplementedError();
  }
}

class HelperParam {
  final int value;

  HelperParam(this.value);
}
