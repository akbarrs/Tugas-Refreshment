import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tugas1/constants/colors.dart';
import 'package:tugas1/models/restaurant.dart';
import 'package:tugas1/screens/home/widget/food_list.dart';
import 'package:tugas1/screens/home/widget/food_list_view.dart';
import 'package:tugas1/screens/home/widget/restaurant_info.dart';
import 'package:tugas1/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  final pagecontroller = PageController(); 
 final restaurant = Restaurant.generateRestaurant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         CustomAppBar(
          Icons.arrow_back_ios_outlined,
          Icons.search_off_outlined,
         ),
         RestaurantInfo(),
         FoodList(selected, 
         (int index) {
          setState(() {
            selected = index;
          });
          pagecontroller.jumpToPage(index);
         }, restaurant),
         Expanded(
          child: FoodListview(
            selected,
            (int index) {
              setState(() {
                selected = index;
              });
            },
            pagecontroller,
            restaurant
          ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 60,
            child: SmoothPageIndicator(
              controller: pagecontroller,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),                  
                ),
                 activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackground,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: DotBorder(
                    color: kPrimaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
                ),
                onDotClicked: (index) => pagecontroller.jumpToPage(index),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        elevation: 2,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
          size: 30,
        )
        
      ),
    );
  }
}