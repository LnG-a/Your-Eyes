import 'package:flutter/widgets.dart';

import '../models/user.dart';
import '../resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  late AppUser _user;
  AppUser get getUser => _user;

  void refreshUser() async {
    AppUser user = await AuthMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
