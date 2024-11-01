import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../AppConstant/app_constant.dart';

class ImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const ImageButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: kColorWhite, // Replace with your kColorGrey if needed
        borderRadius: BorderRadius.circular(25),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath,),
        ),
      ),
    );
  }
}
