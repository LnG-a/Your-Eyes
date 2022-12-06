class Call {
  String callerId;
  String callerName;
  String receiverId;
  String receiverName;
  String channelId;
  bool hasDialled;

  Call(
    this.callerId,
    this.callerName,
    this.receiverId,
    this.receiverName,
    this.channelId,
    this.hasDialled,
  );

  // to map
  Map<String, dynamic> toMap(Call call) {
    Map<String, dynamic> callMap = {};
    callMap["caller_id"] = call.callerId;
    callMap["caller_name"] = call.callerName;
    callMap["receiver_id"] = call.receiverId;
    callMap["receiver_name"] = call.receiverName;
    callMap["channel_id"] = call.channelId;
    callMap["has_dialled"] = call.hasDialled;
    return callMap;
  }

  static Call fromMap(Map<String, dynamic> callMap) => Call(
        callMap["caller_id"],
        callMap["caller_name"],
        callMap["receiver_id"],
        callMap["receiver_name"],
        callMap["channel_id"],
        callMap["has_dialled"],
      );
}
