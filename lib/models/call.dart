class Call {
  String callerId;
  String receiverId;
  String channelId;
  bool hasDialled;

  Call(
    this.callerId,
    this.receiverId,
    this.channelId,
    this.hasDialled,
  );

  // to map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> callMap = {};
    callMap["caller_id"] = callerId;
    callMap["receiver_id"] = receiverId;
    callMap["channel_id"] = channelId;
    callMap["has_dialled"] = hasDialled;
    return callMap;
  }

  static Call fromMap(Map<String, dynamic> callMap) => Call(
        callMap["caller_id"],
        callMap["receiver_id"],
        callMap["channel_id"],
        callMap["has_dialled"],
      );
}
