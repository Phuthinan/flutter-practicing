import 'dart:ffi';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //PageController viewportFraction: ค่ามากยิ่งมองไม่เห็นอันถัดไป

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.height(220);
  int numberPage = 5;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        // print("current value: " + _currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.amber,
          height: Dimensions.height(320),
          child: PageView.builder(
              controller: pageController,
              itemCount: numberPage,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        // สร้าง dot สำหรับแสดงว่าอยู่หน้าไหน
        new DotsIndicator(
          dotsCount: numberPage,
          position: _currentPageValue,
          decorator: DotsDecorator(
            color: Colors.black87, // Inactive color
            activeColor: AppColors.mainColor,
          ),
        ),
        SizedBox(
          height: Dimensions.height(10),
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.height(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  child: BigText(
                text: "Popular",
              )),
              SizedBox(
                width: Dimensions.height(10),
              ),
              Container(
                  child: BigText(
                text: ".",
                color: Colors.black26,
              )),
              SizedBox(
                width: Dimensions.height(10),
              ),
              Container(
                child: SmallText(text: "Food Pairing"),
              )
            ],
          ),
        ),
        //  list of food and images
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.height(15),
                    right: Dimensions.height(15),
                    bottom: Dimensions.height(10)),
                child: Row(
                  children: [
                    //  image section
                    Container(
                      width: Dimensions.width(110),
                      height: Dimensions.width(110),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height(20)),
                          color: Colors.white38,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/image/fishball.jpg"))),
                    ),
                    //  text container
                    Expanded(
                      //Expanded  ใช้พทที่เหลือทั้งหมด
                      child: Container(
                        height: Dimensions.width(100),
                        // width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(Dimensions.height(20)),
                                topLeft:
                                    Radius.circular(Dimensions.height(20))),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.height(10),
                              right: Dimensions.height(10)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                BigText(text: "ลูกชิ้นปลา"),
                                SmallText(text: "ร้อยละ 600 บาท"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndText(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconcolor: AppColors.iconColor1),
                                    IconAndText(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        iconcolor: AppColors.mainColor),
                                    IconAndText(
                                        icon: Icons.access_time_rounded,
                                        text: "32min",
                                        iconcolor: AppColors.iconColor2)
                                  ],
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    //  ให้ stack ต่อไปขนาดเล็กลง
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.height(220),
            margin: EdgeInsets.only(
                left: Dimensions.height(5), right: Dimensions.height(5)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height(30)),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/noodle.jpg"))),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.height(220),
                margin: EdgeInsets.only(
                    left: Dimensions.height(35),
                    right: Dimensions.height(35),
                    bottom: Dimensions.height(30)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0))
                    ]),
                child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height(10),
                        left: Dimensions.height(15),
                        right: Dimensions.height(15)),
                    child: AppColumn(
                      foodName: "Noodle",
                    )),
              ))
        ],
      ),
    );
  }
}
