import 'package:tugas1/models/food.dart';

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String, List<Food>> menu;
  Restaurant(this.name,
  this.waitTime,
  this.distance,
  this.label,
  this.logoUrl,
  this.desc,
  this.score,
  this.menu
  );
static Restaurant generateRestaurant() {
  return Restaurant(
    'Tempat Makan Vokasi',
    '20-30 min',
    '1.4 km',
    'Akbar Tristan Jacub',
    'assets/images/logoUrl.jpg',
    'Selamat Datang Di Tempat Makan Kami',
    4.5,
    {
      'Recommend ' : Food.generateRecommendFoods(),
      'Popular' : Food.generatePopularFoods(),
      'Donuts' : Food.generateDonutsFoods(),
      'Pizza' : Food.generatePizzaFoods(),
    },
  );
}
}