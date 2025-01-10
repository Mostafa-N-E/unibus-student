class AuthInfo{
  final String accessToken;
  final String refreshToken;

  AuthInfo(this.accessToken, this.refreshToken);

}


class UserInfo{
  final int id;
  final String first_name;
  final String last_name;
  final String major;
  final int dormitory;
  final String last_login;
  final int credit_amount;
  final String? phone_number;
  final int gender;

  UserInfo({
    required this.id,
    this.first_name = "",
    this.last_name = "",
    this.major = "",
    this.dormitory = 1,
    this.last_login = "",
    this.credit_amount = 0,
    this.phone_number = null,
    this.gender = 1,
  });

}

UserInfo user_info_builder(Map data){
  return UserInfo(
      id: data['id'],//int.parse(data['id']),
      first_name: data['first_name'] ?? "",
      last_name: data['last_name'] ?? "",
      major: data['major'] ?? "",
    dormitory: data['dormitory']?? 0,
    last_login: data['last_login'] ?? "",
    credit_amount: data['credit_amount'] ?? 0,
    phone_number: data['phone_number'].toString(),
    gender: data['gender'] ?? 1,

  );
}