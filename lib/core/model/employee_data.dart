/// full_name : "Daniel Makinde"
/// phone_number : "08169545791"
/// email : "mayomidedaniel@gmail.com"
/// position : "CEO"
/// salary : "20000000"

class EmployeeData {
  String _fullName;
  String _phoneNumber;
  String _email;
  String _position;
  String _salary;

  String get fullName => _fullName;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get position => _position;
  String get salary => _salary;

  EmployeeData({
      String fullName, 
      String phoneNumber, 
      String email, 
      String position, 
      String salary}){
    _fullName = fullName;
    _phoneNumber = phoneNumber;
    _email = email;
    _position = position;
    _salary = salary;
}

  EmployeeData.fromJson(dynamic json) {
    _fullName = json["full_name"];
    _phoneNumber = json["phone_number"];
    _email = json["email"];
    _position = json["position"];
    _salary = json["salary"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["full_name"] = _fullName;
    map["phone_number"] = _phoneNumber;
    map["email"] = _email;
    map["position"] = _position;
    map["salary"] = _salary;
    return map;
  }

}