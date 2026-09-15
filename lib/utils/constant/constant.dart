class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://dummyjson.com';
  static const String post = '/posts';
  static const String user = '/posts/user/';

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
}
