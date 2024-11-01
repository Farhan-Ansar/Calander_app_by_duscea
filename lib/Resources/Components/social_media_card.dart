import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaCard extends StatelessWidget {
  final String username;
  final String platform;
  final String followers;
  final String growthPercentage;
  final String iconPath;

  const SocialMediaCard({
    Key? key,
    required this.username,
    required this.platform,
    required this.followers,
    required this.growthPercentage,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 8.h, bottom: 8.h),
      child: Container(
        width: 270.w,
        decoration: ShapeDecoration(
          color: kColorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19040F15),
              blurRadius: 30,
              offset: Offset(0, 20),
              spreadRadius: -18,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(iconPath),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: kStyleBlack15600,
                      ),
                      Text(
                        platform,
                        style: kStyleGrey15400,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    followers,
                    style: kStyleBlack28700,
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: ShapeDecoration(
                      color: const Color(0x1954D469),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        growthPercentage,
                        style: kStyleGreen15600,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Followers',
                style: kStyleGrey15400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
