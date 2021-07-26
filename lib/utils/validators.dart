class Validators {
  String isEmpty(value) {
    if (value.isEmpty) {
      return 'Empty field';
    }
    return null;
  }


  String isNumeric(val) {
    if (val.isEmpty) {
      return 'Empty field';
    } else {
      bool valid(val) => double.tryParse(val) != null;
      if (!valid(val)) {
        return 'Phone number is not valid';
      }
      return null;
    }
  }

  String isNumericSalary(val) {
    if (val.isEmpty) {
      return 'Empty field';
    } else {
      bool valid(val) => double.tryParse(val) != null;
      if (!valid(val)) {
        return 'Salary is not valid';
      }
      return null;
    }
  }

  String isEmail(value) {
    if (value.isEmpty) {
      return 'Empty field';
    } else {
      if (!RegExp(
          r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
          .hasMatch(value)) {
        return 'Email is invalid';
      }
      return null;
    }
  }
}