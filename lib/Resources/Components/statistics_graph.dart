import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:duseca_calender_app/Resources/Components/statistics_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class StatisticsGraph extends StatefulWidget {
  const StatisticsGraph({Key? key}) : super(key: key);

  @override
  State<StatisticsGraph> createState() => _StatisticsGraphState();
}

class _StatisticsGraphState extends State<StatisticsGraph> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Container(
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
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Statistics',
                style: kStyleBlack20600,
              ),
              SizedBox(height: 10.h,),
              Container(
                padding: const EdgeInsets.only(
                  top: 14,
                  left: 16,
                  right: 14,
                  bottom: 14,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: kColorGrey),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'This Week',
                      style: kStyleGrey15400,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: kColorGreyTextColor,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share',
                      style: kStyleGrey15400,
                    ),
                    Text(
                      'Likes',
                      style: kStyleGrey15400,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    '684,68K',
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
                  const Spacer(),
                  Text(
                    '34,310',
                    style: kStyleBlack28700,
                  ),
                ],
              ),
              BarChartSample3()


            ],
          ),
        ),
      ),
    );
  }
}
