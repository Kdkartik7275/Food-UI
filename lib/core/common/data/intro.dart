import 'package:assignment/core/utils/constants/images.dart';

class IntroApp {
  final String image;
  final String title;
  final String subtitle;

  IntroApp({required this.image, required this.title, required this.subtitle});
}

List<IntroApp> data = [
  IntroApp(
      image: AppImages.onboard,
      title: 'Choose & Customize',
      subtitle:
          'Choose your platter type and personalize it by selecting your favorite items!'),
  IntroApp(
      image: AppImages.thinking,
      title: 'Choose Services',
      subtitle:
          'Select the type of services from varying cutlery, mode of serving options, & more'),
  IntroApp(
      image: AppImages.bank,
      title: 'Dynamic Pricing',
      subtitle:
          'Price per plate varies with no. of items in a plate and no. of plates selected'),
  IntroApp(
      image: AppImages.away,
      title: 'Track Your Order',
      subtitle:
          'Track the order status and seek help from the executives anytime'),
  IntroApp(
      image: AppImages.vegan,
      title: 'Taste Your Samples',
      subtitle:
          'Explode your taste bud with samples of what you order(on request for eligible orders)'),
  IntroApp(
      image: AppImages.eating,
      title: 'Enjoy Food and Services',
      subtitle: 'Enjoy event with delicious and customized food'),
];
