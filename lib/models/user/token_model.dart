class Token {
  late String token;
  late String expires;

  Token({required this.token, required this.expires});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    data['expires'] = expires;
    return data;
  }
}