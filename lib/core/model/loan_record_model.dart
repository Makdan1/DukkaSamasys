/// month : "Jan"
/// borrowed : "50000"
/// receivable : "100000"

class LoanRecordModel {
  String _month;
  int _borrowed;
  int _receivable;

  String get month => _month;
  int get borrowed => _borrowed;
  int get receivable => _receivable;

  LoanRecordModel({
      String month,
    int borrowed,
    int receivable}){
    _month = month;
    _borrowed = borrowed;
    _receivable = receivable;
}

  LoanRecordModel.fromJson(dynamic json) {
    _month = json["month"];
    _borrowed = json["borrowed"];
    _receivable = json["receivable"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["month"] = _month;
    map["borrowed"] = _borrowed;
    map["receivable"] = _receivable;
    return map;
  }

}