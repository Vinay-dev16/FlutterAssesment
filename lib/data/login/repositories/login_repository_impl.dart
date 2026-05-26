import '../../../domain/login/entities/user.dart';
import '../../../domain/login/repositories/login_repository.dart';
import '../../core/api_client.dart';
import '../../core/api_constants.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiClient _apiClient;

  LoginRepositoryImpl({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  @override
  Future<User> login(String email, String password) async {
    final response = await _apiClient.post(
      ApiConstants.login,
      body: {
        'email': email,
        'password': password,
      },
    );

    final token = response['token']?.toString() ?? '';

    return User(email: email, token: token);
  }
}
