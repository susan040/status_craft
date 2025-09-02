import 'package:status_craft/utils/image_path.dart';

class OnboardPage {
  final String image;
  final String title;
  final String description;

  OnboardPage({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardPage> onboardingPages = [
  OnboardPage(
    image: ImagePath.easySearch,
    title: "Easy to Search",
    description: "Start chatting with status \ncrafter now",
  ),
  OnboardPage(
    image: ImagePath.easyAccess,
    title: "Easy to Access",
    description: "Start chatting with status \ncrafter now",
  ),
];
