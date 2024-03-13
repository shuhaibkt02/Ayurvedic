import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthService {
  Future<void> loginUser({required String username, required String password});
  Future<String?> loadToken();
  Future<void> storeToken({required String token});
  Future<void> clearToken();
}

class AuthRepository implements AuthService {
  final Dio dio = Dio();
  String baseUri = 'https://flutter-amr.noviindus.in/api';
  String token = '';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> clearToken() async {
    await _secureStorage.delete(key: 'token');
  }

  @override
  Future<void> storeToken({required String token}) async {
    await _secureStorage.write(key: 'token', value: token);
  }

  @override
  Future<String?> loadToken() async {
    return await _secureStorage.read(key: 'token');
  }

  @override
  Future<void> loginUser(
      {required String username, required String password}) async {
    try {
      FormData formData = FormData.fromMap({
        'username': username,
        'password': password,
      });
      Response response = await dio.post('$baseUri/Login', data: formData);
      final responseData = response.data as Map<String, dynamic>;
      token = responseData['token'];
      await storeToken(token: token); // Store token for future requests
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
