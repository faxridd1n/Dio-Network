import 'package:dio/dio.dart';

import '../../core/api/api.dart';
import '../../core/config/dio_config.dart';
import '../../model/users_model.dart';
import '../log_service.dart';

class GetUserService {
  static final GetUserService _inheritance = GetUserService._init();
  static GetUserService get inheritance => _inheritance;
  GetUserService._init();
  static Future<List<Users>?> getUser() async {
    try {
      Response res =
          await DioConfig.inheritance.createRequest().get(Urls.getUsers);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());
      if (res.statusCode == 200) {
        List<Users> usersList = [];
        for (var e in (res.data as List)) {
          usersList.add(Users.fromJson(e));
        }
        return usersList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }
    return null;
  }
}
