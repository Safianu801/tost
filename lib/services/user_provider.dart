import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  Profile _profile = Profile(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    isVerified: false,
    isArchived: false,
  );

  String? _loggedInUserId;

  Profile get profile => _profile;

  String? get loggedInUserId => _loggedInUserId;

  void setUser(String user) {
    try {
      final profileData = Profile.fromJson(user);
      _profile = profileData;
      _loggedInUserId = profileData.id;
      notifyListeners();
    } catch (e) {
      print("Failed to set user: $e");
    }
  }

  void setUserFromModel(Profile profile) {
    _profile = profile;
    _loggedInUserId = profile.id;
    notifyListeners();
  }

  void clearUser() {
    _profile = Profile(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      isVerified: false,
      isArchived: false,
    );
    _loggedInUserId = null;
    notifyListeners();
  }
}
