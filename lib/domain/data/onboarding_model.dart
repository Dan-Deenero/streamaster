final List<OnboardingModel> onboarding = [
  OnboardingModel(
      heading: "Set your own goals and get better",
      description:
          "Goal support your motivation and inspire you to work harder",
      image: "assets/images/photos/s1.png"),
  OnboardingModel(
      heading: "Track your progress with statistics",
      description:
          "Analyse personal result with detailed chart and numerical values",
      image: "assets/images/photos/s2.png"),
  OnboardingModel(
      heading: "Create photo comparision and share",
      description:
          "Take before and after photos to visualize progress.",
      image: "assets/images/photos/s3.png"),
  
];

class OnboardingModel {
  String heading;
  String description;
  String image;
  OnboardingModel(
      {required this.heading, required this.description, required this.image});
}