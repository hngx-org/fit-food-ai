class OnboardingInfoModel {
  final String tittle;
  final String subttittle;
  final String imageDir;

  OnboardingInfoModel(
      {required this.tittle, required this.subttittle, required this.imageDir});

  static List<OnboardingInfoModel> defaultInfo = [
    OnboardingInfoModel(
        tittle: "Chat AI Bot",
        subttittle: "Chat with our AI bot for available\nmeals to keep you fit.",
        imageDir: "assets/send-msg.png"),
    OnboardingInfoModel(
        tittle: "Get Foods",
        subttittle:
            "Get a list of foods that meets\nyour desired fitness goals.",
        imageDir: "assets/diet-list.png"),
    OnboardingInfoModel(
        tittle: "Healthy Body",
        subttittle:
            "Good food creates a healthy body\nfor a healthy mind; want to try?",
        imageDir: "assets/running.png"),
  ];
}
