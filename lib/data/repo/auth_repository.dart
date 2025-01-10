import 'package:flutter/cupertino.dart';
import '../../common/http_client.dart';
import '../../data/auth_info.dart';
import '../../data/source/auth_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepository = AuthRepository(AuthRemoteDataSource(
  httpClient,
));

abstract class IAuthRepository {
  Future<void> login(String username, String password);
  Future<UserInfo> user_info();
  Future<void> refreshToken();
  Future<void> signOut();
  Future<Map> password_reset(Map body);
}

class AuthRepository implements IAuthRepository {
  static final ValueNotifier<AuthInfo?> authChangeNotifier = ValueNotifier(null);
  static final ValueNotifier<UserInfo?> userInfoChangeNotifier = ValueNotifier(null);

  final IAuthDataSource dataSource;

  AuthRepository(
    this.dataSource,
  );
  @override
  Future<void> login(String username, String password) async {
    final AuthInfo authInfo = await dataSource.login(username, password);
    _persistAuthTokens(authInfo);

    debugPrint("access token is: " + authInfo.accessToken);
  }

  @override
  Future<UserInfo> user_info() async {
    final UserInfo userInfo = await dataSource.user_info();
    _persistUserInfo(userInfo);
    debugPrint("id is: " + userInfo.id.toString());

    return userInfo;
  }

  @override
  Future<void> refreshToken() async {
    if (authChangeNotifier.value != null) {
      final AuthInfo authInfo =
          await dataSource.refreshToken(authChangeNotifier.value!.refreshToken);
      debugPrint('refresh token is: ${authInfo.refreshToken}');
      _persistAuthTokens(authInfo);
    }
  }

  Future<void> _persistAuthTokens(AuthInfo authInfo) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("access_token", authInfo.accessToken);
    sharedPreferences.setString("refresh_token", authInfo.refreshToken);
    loadAuthInfo();
  }

  Future<void> _persistUserInfo(UserInfo userInfo) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setInt("user_id", userInfo.id);
    sharedPreferences.setString("user_first_name", userInfo.first_name);
    sharedPreferences.setString("user_last_name", userInfo.last_name);

    loadAuthInfo();
  }

  Future<void> loadAuthInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String accessToken =
        sharedPreferences.getString("access_token") ?? '';

    final String refreshToken =
        sharedPreferences.getString("refresh_token") ?? '';
    if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      authChangeNotifier.value = AuthInfo(accessToken, refreshToken);
      token = accessToken;
    }
  }

  Future<void> loadUserInfo() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    final int user_id = sharedPreferences.getInt("user_id") ?? 0;
    if (user_id != 0 ) {
      userInfoChangeNotifier.value = UserInfo(id: user_id);
      global_userInfo = UserInfo(id: user_id);
    }
  }

  Future<UserInfo> get_user_info({refresh = false}) async {
    // final SharedPreferences sharedPreferences =
    // await SharedPreferences.getInstance();
    // final int user_id = sharedPreferences.getInt("user_id") ?? 0;

    if (global_userInfo.id != -1 && !refresh) {
      debugPrint("  id is: ${global_userInfo.id} ------------------------------------------------");
      return global_userInfo;
    }else{
      global_userInfo = await dataSource.user_info();
      // _persistUserInfo(userInfo);
      // debugPrint("id is: ${user_id}");
      return global_userInfo;
    }
  }

  @override
  Future<void> signOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
    authChangeNotifier.value = null;
    dataSource.logout();

  }

  @override
  Future<Map> password_reset(Map body) => dataSource.password_reset(body);
}
