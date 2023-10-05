extension StringExt on String {
  String get messageResponse => replaceAll(
      RegExp(
        r'Message:',
      ),
      '');

  String get errorResponse => replaceAll(RegExp(r'Error:'), '');

  String get formattedPrompt =>
      "Only give a nice response if these prompt is  related to FOOD and FITNESS else give a notice that its not related:$this";
}
