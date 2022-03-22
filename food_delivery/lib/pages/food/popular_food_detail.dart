import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //  background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.height(350),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/noodle.jpg"))),
              )),
          //  icon button
          Positioned(
              top: Dimensions.height(45),
              left: Dimensions.width(20),
              right: Dimensions.width(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          //  introduction
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.height(350 - 20),
              child: Container(
                  height: Dimensions.height(330),
                  padding: EdgeInsets.only(
                      left: Dimensions.width(20),
                      right: Dimensions.width(20),
                      top: Dimensions.height(20)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.height(20)),
                          topLeft: Radius.circular(Dimensions.height(20))),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        foodName: "Noodle",
                      ),
                      SizedBox(
                        height: Dimensions.height(20),
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: Dimensions.height(20),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(
                              text:
                                  "Noodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. Noodles can be refrigerated for short-term storage or dried and stored for future use. Noodles are usually cooked in boiling water, sometimes with cooking oil or salt added."),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: Container(
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
                  borderRadius: BorderRadius.circular(Dimensions.height(20)),
                  color: Colors.white),
              child: Row(children: [
                Icon(
                  Icons.remove,
                  color: AppColors.signColor,
                ),
                SizedBox(
                  width: Dimensions.width(5),
                ),
                BigText(
                  text: "0",
                  size: Dimensions.height(18),
                ),
                SizedBox(
                  width: Dimensions.width(5),
                ),
                Icon(
                  Icons.add,
                  color: AppColors.signColor,
                )
              ]),
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
                  borderRadius: BorderRadius.circular(Dimensions.height(20)),
                  color: AppColors.mainColor),
            )
          ],
        ),
      ),
    );
  }
}
