import 'package:flutter/material.dart';
import 'package:new_app_1/utils/colors.dart';
import 'package:new_app_1/widgets/large_text.dart';
import 'package:new_app_1/widgets/small_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isResponsive == true
                ? LargeText(
                    text: "Book trip now",
                    size: 20,
                    color: Colors.black54,
                  )
                : Container(),
            LargeText(
              text: ">>>>",
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
