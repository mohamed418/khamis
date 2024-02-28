class LoginModel {
  final String message;
  final bool statusCode;

  LoginModel({required this.message, required this.statusCode});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status_code': statusCode,
    };
  }
}
