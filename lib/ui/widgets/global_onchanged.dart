void emailOnChanged(value) {
  bool isCorrect;
  if (!value.contains("@") ||
      !RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$').hasMatch(value)) {
    isCorrect = false;
  } else {
    isCorrect = true;
  }
}

void passwordOnChanged(value) {
  bool isCorrect;
  if (value.length < 8 || !RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(value)) {
    isCorrect = false;
  } else {
    isCorrect = true;
  }
}
