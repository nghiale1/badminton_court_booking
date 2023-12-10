class ResponseData<T> {
  int? code = 0;
  T? data;
  String? message;
  String? debugMessage;

  ResponseData(
      {required this.code, this.data, this.message, this.debugMessage});

  ResponseData.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = json['data'] as T?,
        message = json['message'] as String?,
        debugMessage = json['debugMessage'] as String?;

  Map<String, dynamic> toJson() => {
        'code': code,
        'data': data,
        'message': message,
        'debugMessage': debugMessage
      };
}
