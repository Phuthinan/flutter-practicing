import 'package:flutter/material.dart';
import 'package:new_app_1/utils/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double width;

  ResponsiveButton({Key? key, required this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.skip_next_outlined,
            color: Colors.black45,
            size: 50,
          ),
        ],
      ),
    );
  }
}
