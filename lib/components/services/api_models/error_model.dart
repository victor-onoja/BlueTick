class Error {
  Map<String, dynamic>? message;
  int? code;
  Error({this.message, this.code});

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        message: json['message'],
      );
}
