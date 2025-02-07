extension StringExt on String {
  String withImage({String type = 'jpg'}) {
    return 'assets/images/$this.$type';
  }
}
