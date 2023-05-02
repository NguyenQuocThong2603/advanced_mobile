class Message {
  Message({
    required this.role,
    required this.message,
  });
  final String role;
  final String message;
  factory Message.fromJson(dynamic json){
    return Message(role: json['role'], message: json['message']);
  }

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map['role'] = role;
    map['message'] = message;
    return map;
  }
}
