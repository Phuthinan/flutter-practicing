import 'package:flutter/material.dart';
import 'package:new_app_1/utils/colors.dart';
import 'package:new_app_1/widgets/app_button.dart';
import 'package:new_app_1/widgets/large_text.dart';
import 'package:new_app_1/widgets/responsive_button.dart';
import 'package:new_app_1/widgets/small_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int numStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image/mountain2.jpg"),
                          fit: BoxFit.cover)),
                )),
            Positioned(
              left: 20,
              top: 70,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
                top: 280,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 550,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LargeText(
                            text: "อุทยานเขาหินงู",
                            color: Colors.black.withOpacity(0.8),
                          ),
                          LargeText(
                            text: "500฿",
                            color: AppColors.mainBlackColor,
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          SmallText(
                            text: "THA, Ratchaburi",
                            color: AppColors.textColor,
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: numStar > index
                                    ? AppColors.mainColor
                                    : AppColors.textColor,
                              );
                            }),
                          ),
                          SizedBox(width: 10),
                          SmallText(text: "(4.0)")
                        ],
                      ),
                      SizedBox(height: 25),
                      LargeText(
                          text: "People", color: Colors.black.withOpacity(0.8)),
                      SizedBox(height: 5),
                      SmallText(text: "Number of people in your group"),
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackgroundColor,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackgroundColor,
                                  size: 50,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      LargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        child: Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SmallText(
                                text:
                                    "อยู่ห่างจากตัวจังหวัดราชบุรีประมาณ 8  กิโลเมตร ตำบลเกาะพลับพลา อำเภอเมือง จังหวัดราชบุรี  แต่เดิมเป็นแหล่งระเบิดและย่อยหินที่สำคัญของไทยตั้งแต่สมัยต้นรัตนโกสินทร์ เนื่องจากเป็นปูนที่มีคุณภาพดี ต่อมาทั้งภาครัฐและประชาชนได้เล็งเห็นถึงความเสื่อมโทรมของสภาพภูมิประเทศ และวิวทิวทัศน์ "),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      color: AppColors.textColor,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.textColor,
                      size: 60,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 20),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
