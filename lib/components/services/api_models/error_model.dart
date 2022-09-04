class ErrorModel {
  Map<String, dynamic>? message;
  int? code;
  ErrorModel({this.message, this.code});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        message: json['message'],
      );
}
