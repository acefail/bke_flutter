class AuthResponse {
  String? sessionId;
  String? accessToken;
  String? accessTokenExpiresAt;
  String? refreshToken;
  String? refreshTokenExpiresAt;
  User? user;

  AuthResponse({
    this.sessionId,
    this.accessToken,
    this.accessTokenExpiresAt,
    this.refreshToken,
    this.refreshTokenExpiresAt,
    this.user,
  });

  AuthResponse.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'] as String?;
    accessToken = json['access_token'] as String?;
    accessTokenExpiresAt = json['access_token_expires_at'] as String?;
    refreshToken = json['refresh_token'] as String?;
    refreshTokenExpiresAt = json['refresh_token_expires_at'] as String?;
    user = (json['user'] as Map<String, dynamic>?) != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['session_id'] = sessionId;
    json['access_token'] = accessToken;
    json['access_token_expires_at'] = accessTokenExpiresAt;
    json['refresh_token'] = refreshToken;
    json['refresh_token_expires_at'] = refreshTokenExpiresAt;
    json['user'] = user?.toJson();
    return json;
  }
}

class User {
  String? username;
  String? fullName;
  String? email;
  String? passwordChangedAt;
  String? createdAt;

  User({
    this.username,
    this.fullName,
    this.email,
    this.passwordChangedAt,
    this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'] as String?;
    fullName = json['full_name'] as String?;
    email = json['email'] as String?;
    passwordChangedAt = json['password_changed_at'] as String?;
    createdAt = json['created_at'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    json['full_name'] = fullName;
    json['email'] = email;
    json['password_changed_at'] = passwordChangedAt;
    json['created_at'] = createdAt;
    return json;
  }
}
