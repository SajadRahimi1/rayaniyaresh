extension ListExtention on List {
  String valueToString() {
    String value = "";
    for (var item in this) {
      value += item;
    }
    return value;
  }
}
