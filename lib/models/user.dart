class AppUser {
  String uid;
  String email;
  bool isBlind;

  AppUser(this.uid, this.email, this.isBlind);

  Map toMap() {
    Map<String, dynamic> data = {};
    data['uid'] = uid;
    data['email'] = email;
    data["isBlind"] = isBlind;
    return data;
  }

  static AppUser fromMap(Map<String, dynamic> json) => AppUser(
        json["uid"],
        json["email"],
        json["isBlind"],
      );
}
