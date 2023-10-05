extension StringExt on String {
  String get messageResponse => replaceAll(
      RegExp(
        r'Message:',
      ),
      '');

  String get errorResponse => replaceAll(RegExp(r'Error:'), '');
}
