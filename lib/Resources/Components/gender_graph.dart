import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:duseca_calender_app/Resources/Components/circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GenderGraph extends StatefulWidget {
  const GenderGraph({Key? key}) : super(key: key);

  @override
  State<GenderGraph> createState() => _GenderGraphState();
}

class _GenderGraphState extends State<GenderGraph> {
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gender',
                    style: kStyleBlack20600,
                  ),
                  SvgPicture.asset("assets/images/More 2.svg"),
                ],
              ),
              const CircularProgressIndicatorWidget(
                progress: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/purpleCircle.svg"),
                        SizedBox(
                          width: 5.w,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Male:',
                                style: kStyleGrey15400,
                              ),
                              TextSpan(
                                text: ' 500K',
                                style: kStyleBlack15600,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/yellowCircle.svg"),
                        SizedBox(
                          width: 5.w,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Female:',
                                style: kStyleGrey15400,
                              ),
                              TextSpan(
                                text: ' 300K',
                                style: kStyleBlack15600,
                              ),
                            ],
                          ),
                        ),
                      ],
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
