String? passwordValidator(password) {
  if (password.isEmpty) {
    return "Please fill your password";
  }
  if (password!.length < 8) {
    return "Password's length should be minimum 8 character";
  } else if (!RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(password)) {
    return "Incorrect password";
  } else {
    null;
  }
  return null;
}

String? emailValidator(mail) {
  if (mail == '') {
    return "Please fill your email";
  }
  if (!mail!.contains('@') ||
      !RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$').hasMatch(mail)) {
    return "Incorrect Email";
  } else {
    return null;
  }
}

String? numberValidator(number) {
  if (number.length < 9) {
    return "Incorrect number";
  }
  return null;
}

String? nameValidator(name) {
  if (name!.isEmpty) {
    return "Please Enter full name";
  } else if (!RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(name)) {
    return "Incorrect fullname";
  }
  return null;
}

String? nickValidator(name) {
  if (name!.isEmpty) {
    return "Enter Nickname";
  } else if (!RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(name)) {
    return "Incorrect nickname";
  }
  return null;
}
