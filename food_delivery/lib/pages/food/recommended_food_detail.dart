import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text.dart';

class RecommendFoodDetail extends StatelessWidget {
  const RecommendFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height(80),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.width(20)),
                          topRight: Radius.circular(Dimensions.width(20)))),
                  width: double.maxFinite,
                  child: Center(
                      child: BigText(
                    text: "Noodle",
                    size: Dimensions.height(26),
                  )),
                  padding: EdgeInsets.only(
                      top: Dimensions.height(5), bottom: Dimensions.height(10)),
                )),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.height(300),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/noodle.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.all(Dimensions.height(20)),
                    child: ExpandableText(
                        text:
                            "Noodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. Noodles can be refrigerated for short-term storage or dried and stored for future use. Noodles are usually cooked in boiling water, sometimes with cooking oil or salt addedNoodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. Noodles can be refrigerated for short-term storage or dried and stored for future use. Noodles are usually cooked in boiling water, sometimes with cooking oil or salt addedNoodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. Noodles can be refrigerated for short-term storage or dried and stored for future use. Noodles are usually cooked in boiling water, sometimes with cooking oil or salt addedNoodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. Noodles can be refrigerated for short-term storage or dried and stored for future use. Noodles are usually cooked in boiling water, sometimes with cooking oil or salt addedNoodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. Noodles can be refrigerated for short-term storage or dried and stored for future use. Noodles are usually cooked in boiling water, sometimes with cooking oil or salt addedNoodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. Noodles can be refrigerated for short-term storage or dried and stored for future use. Noodles are usually cooked in boiling water, sometimes with cooking oil or salt addedNoodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. Noodles can be refrigerated for short-term storage or dried and stored for future use. Noodles are usually cooked in boiling water, sometimes with cooking oil or salt added")),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width(50),
              right: Dimensions.width(50),
              top: Dimensions.height(10),
              bottom: Dimensions.height(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.height(24),
                  iconColor: Colors.white,
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                ),
                BigText(
                  text: "60 " + " x " + " 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.height(26),
                ),
                AppIcon(
                  iconSize: Dimensions.height(24),
                  iconColor: Colors.white,
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                )
              ],
            ),
          ),
          Container(
            height: Dimensions.height(120),
            padding: EdgeInsets.only(
                top: Dimensions.height(20),
                bottom: Dimensions.height(20),
                left: Dimensions.width(20),
                right: Dimensions.width(20)),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height(20)),
                    topRight: Radius.circular(Dimensions.height(20)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height(20),
                      bottom: Dimensions.height(20),
                      right: Dimensions.width(20),
                      left: Dimensions.width(20)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.height(20)),
                      color: Colors.white),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  child: BigText(
                    text: "80|Add to cart",
                    size: Dimensions.height(18),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                      top: Dimensions.height(20),
                      bottom: Dimensions.height(20),
                      right: Dimensions.width(20),
                      left: Dimensions.width(20)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.height(20)),
                      color: AppColors.mainColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
