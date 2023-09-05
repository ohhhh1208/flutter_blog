class BaseResult {
  int errorCode;
  String errorMsg;
  dynamic data;

  BaseResult({required this.errorCode, required this.errorMsg, this.data});

  factory BaseResult.fromJson(json) {
    return BaseResult(
      errorCode: json["errorCode"],
      errorMsg: json["errorMsg"],
      data: json["data"],
    );
  }
}
