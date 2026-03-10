import 'package:get/get.dart';

class Controller extends GetxController {
  final List<Map<String, String>> categories = [
    {'name': 'AI Tech', 'icon': 'assets/images/ai.svg'},
    {'name': 'Software Co', 'icon': 'assets/images/whale.svg'},
    {'name': 'Education', 'icon': 'assets/images/graduation.svg'},
    {'name': 'Construction', 'icon': 'assets/images/construction.svg'},
    {'name': 'Real Estate', 'icon': 'assets/images/estate.svg'},
  ];
  final List<Map<String, dynamic>> fundedProjects = [
    {
      'title': 'Beyond',
      'subtitle': 'IT Company',
      'svg': 'assets/images/building.svg',
      'raised': '\$22.1 M',
      'minInv': '\$124.0',
      'shareholders': '2506',
    },
    {
      'title': 'TechNova',
      'subtitle': 'Software House',
      'svg': 'assets/images/group_laptop.svg',
      'raised': '\$15.5 M',
      'minInv': '\$100.0',
      'shareholders': '1850',
    },
  ];
}
