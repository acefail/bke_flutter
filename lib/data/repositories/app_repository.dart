import 'package:bke/data/models/auth_reponse.dart';

import '../../utils/api_constant.dart';
import '../source/remote/api_service.dart';

class AppRepository {
  final _apiClient = APIClient();

  Future<AuthResponse> doLogin(String email, String password) {
    const path = ApiConstant.doLoginPath;
    final queryParams = {'username': email, 'password': password};
    final loginService = APIService(
      path,
      body: queryParams,
      (response) => AuthResponse.fromJson(response),
    );
    return _apiClient.post(loginService);
  }
}
