class AppUser {
  String uid;
  String name;
  String email;
  String username;
  String status;
  int state;

  AppUser(
    this.uid,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
  );

  Map toMap(AppUser user) {
    Map<String, dynamic> data = {};
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data["status"] = user.status;
    data["state"] = user.state;
    return data;
  }

  static AppUser fromMap(Map<String, dynamic> json) => AppUser(
        json["uid"],
        json["name"],
        json["email"],
        json["username"],
        json["status"],
        json["state"],
      );
}
