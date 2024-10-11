class SignupModel {
  bool? success;
  int? code;
  String? message;
  Body? body;

  SignupModel({this.success, this.code, this.message, this.body});

  SignupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  int? id;
  int? role;
  int? categoryid;
  String? username;
  int? subcatgoeryid;
  int? categoryType;
  String? image;
  String? coverImage;
  String? firstName;
  String? lastName;
  int? isSocailLoggedIn;
  int? verified;
  int? status;
  String? email;
  String? password;
  String? dob;
  String? countryCode;
  String? phone;
  int? otp;
  String? customerId;
  String? uniqueId;
  int? notificationStatus;
  int? points;
  int? spentTotal;
  String? facebookId;
  String? googleId;
  String? appleId;
  int? deviceType;
  String? deviceToken;
  int? created;
  int? updated;
  String? createdAt;
  String? updatedAt;
  String? token;

  Body(
      {this.id,
      this.role,
      this.categoryid,
      this.username,
      this.subcatgoeryid,
      this.categoryType,
      this.image,
      this.coverImage,
      this.firstName,
      this.lastName,
      this.isSocailLoggedIn,
      this.verified,
      this.status,
      this.email,
      this.password,
      this.dob,
      this.countryCode,
      this.phone,
      this.otp,
      this.customerId,
      this.uniqueId,
      this.notificationStatus,
      this.points,
      this.spentTotal,
      this.facebookId,
      this.googleId,
      this.appleId,
      this.deviceType,
      this.deviceToken,
      this.created,
      this.updated,
      this.createdAt,
      this.updatedAt,
      this.token});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    categoryid = json['categoryid'];
    username = json['username'];
    subcatgoeryid = json['subcatgoeryid'];
    categoryType = json['category_type'];
    image = json['image'];
    coverImage = json['coverImage'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    isSocailLoggedIn = json['isSocailLoggedIn'];
    verified = json['verified'];
    status = json['status'];
    email = json['email'];
    password = json['password'];
    dob = json['dob'];
    countryCode = json['countryCode'];
    phone = json['phone'];
    otp = json['otp'];
    customerId = json['customer_id'];
    uniqueId = json['unique_id'];
    notificationStatus = json['notificationStatus'];
    points = json['points'];
    spentTotal = json['spentTotal'];
    facebookId = json['facebookId'];
    googleId = json['googleId'];
    appleId = json['appleId'];
    deviceType = json['deviceType'];
    deviceToken = json['deviceToken'];
    created = json['created'];
    updated = json['updated'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['categoryid'] = this.categoryid;
    data['username'] = this.username;
    data['subcatgoeryid'] = this.subcatgoeryid;
    data['category_type'] = this.categoryType;
    data['image'] = this.image;
    data['coverImage'] = this.coverImage;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['isSocailLoggedIn'] = this.isSocailLoggedIn;
    data['verified'] = this.verified;
    data['status'] = this.status;
    data['email'] = this.email;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['countryCode'] = this.countryCode;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['customer_id'] = this.customerId;
    data['unique_id'] = this.uniqueId;
    data['notificationStatus'] = this.notificationStatus;
    data['points'] = this.points;
    data['spentTotal'] = this.spentTotal;
    data['facebookId'] = this.facebookId;
    data['googleId'] = this.googleId;
    data['appleId'] = this.appleId;
    data['deviceType'] = this.deviceType;
    data['deviceToken'] = this.deviceToken;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
