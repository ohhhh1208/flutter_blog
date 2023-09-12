import 'package:flutter_blog/utils/storage_manager.dart';

import '../net/request_repository.dart';
import '../provider/view_state_model.dart';

const String kLoginName = 'kLoginName';

class LoginPageViewModel extends ViewStateModel {
  Future<bool> login(name, password) async {
    setBusy();
    Map param = {};
    param['username'] = name;
    param['password'] = password;
    try {
      var result = await RequestRepository.getInstance()?.login(param);
      StorageManager.sharedPreferences.setString(kLoginName, result?.username ?? "");
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }

  Future<bool> register(name, password, repassword) async {
    setBusy();
    Map param = {};
    param['username'] = name;
    param['password'] = password;
    param['repassword'] = repassword;
    try {
      var result = await RequestRepository.getInstance()?.register(param);
      StorageManager.sharedPreferences.setString(kLoginName, result?.username ?? "");
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }
}
