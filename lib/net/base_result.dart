class BaseResult {
  int code;
  String msg;
  dynamic data;

  BaseResult({required this.code, required this.msg, this.data});

  factory BaseResult.fromJson(json) {
    return BaseResult(
      code: json["code"],
      msg: json["msg"],
      data: json["data"],
    );
  }
}
