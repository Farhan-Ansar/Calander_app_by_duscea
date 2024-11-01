import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:duseca_calender_app/Resources/Components/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FollowersChart extends StatefulWidget {
  const FollowersChart({super.key});

  @override
  State<FollowersChart> createState() => _FollowersChartState();
}

class _FollowersChartState extends State<FollowersChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19040F15),
              blurRadius: 30,
              offset: Offset(0, 20),
              spreadRadius: -18,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Followers',
                    style: kStyleBlack20600,
                  ),
                  SvgPicture.asset("assets/images/More 2.svg"),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(
                    '254,68K',
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
                        '6.18%',
                        style: kStyleGreen15600,
                      ),
                    ),
                  ),
                ],
              ),
              BarChartSample2(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '834',
                      textAlign: TextAlign.center,
                      style: kStyleGreen24600,
                    ),
                    Text(
                      '152',
                      textAlign: TextAlign.center,
                      style: kStyleRed24600,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Followers',
                      textAlign: TextAlign.center,
                      style: kStyleGrey15400,
                    ),
                    Text(
                      'UnFollowed',
                      textAlign: TextAlign.center,
                      style: kStyleGrey15400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
