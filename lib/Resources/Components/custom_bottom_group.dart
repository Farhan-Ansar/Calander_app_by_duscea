import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonGroup extends StatefulWidget {
  const CustomButtonGroup({super.key});

  @override
  _CustomButtonGroupState createState() => _CustomButtonGroupState();
}

class _CustomButtonGroupState extends State<CustomButtonGroup> {
  int _selectedIndex = 0;

  Widget buildButton(String text, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: ShapeDecoration(
          color: isSelected ? Colors.white : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.sp),
          ),
          shadows: isSelected
              ? [
            const BoxShadow(
              color: Color(0x05000000),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
            const BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? const Color(0xFF1A1826) : const Color(0xFF637085),
              fontSize: 15,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: ShapeDecoration(
        color: kColorGreyLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.sp),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildButton("Month", 0),
          buildButton("Week", 1),
          buildButton("Day", 2),
        ],
      ),
    );
  }
}
