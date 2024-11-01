import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'image': 'assets/images/overview.svg',
      'title': 'Overview',
      'trailing': false,
      'route': 'overViewScreen',
    },
    {
      'image': 'assets/images/ecommerce.svg',
      'title': 'E-Commerce',
      'trailing': true,
    },
    {
      'image': 'assets/images/Mail.svg',
      'title': 'Calendar',
      'trailing': false,
      'route': 'HomeScreen',
    },
    {
      'image': 'assets/images/Mail.svg',
      'title': 'Mail',
      'trailing': true,
      'number': 3,
    },
    {
      'image': 'assets/images/Chat.svg',
      'title': 'chat',
      'trailing': false,
      'route': 'chatListScreen',
    },
    {
      'image': 'assets/images/Tasks.svg',
      'title': 'Tasks',
      'trailing': false,
    },
    {
      'image': 'assets/images/Projects.svg',
      'title': 'Projects',
      'trailing': false,
    },
    {
      'image': 'assets/images/File Manager.svg',
      'title': 'File Manager',
      'trailing': false,
    },
    {
      'image': 'assets/images/Notes.svg',
      'title': 'Notes',
      'trailing': false,
    },
    {
      'image': 'assets/images/Contacts.svg',
      'title': 'Contacts',
      'trailing': false,
    },
  ];

  int? selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kColorBackGround,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset("assets/images/FullLogo.svg"),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final isSelected = selectedIndex == index;

                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      if (item['route'] != null) {
                        Navigator.pushNamed(context, item['route']);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? kColorSelected : Colors.transparent,
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          item['image'],
                          color: isSelected ? kColorBlue : null,
                        ),
                        title: Text(
                          item['title'],
                          style: isSelected
                              ? kStyleBlack15600.copyWith(color: kColorBlue)
                              : kStyleBlack15600,
                        ),
                        trailing: item['trailing'] == true
                            ? (item['number'] != null
                                ? CircleAvatar(
                                    backgroundColor: kColorRed2,
                                    radius: 10,
                                    child: Text(
                                      item['number'].toString(),
                                      style: const TextStyle(
                                          color: kColorWhite, fontSize: 12),
                                    ),
                                  )
                                : Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color:
                                        isSelected ? kColorBlue : kColorBlack,
                                    size: 15,
                                  ))
                            : null,
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "CALENDARS",
                      style: kStyleGrey15600,
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    color: kColorGreyTextColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 8.r,
                  backgroundColor: kColorRed2,
                ),
                title: Text(
                  "Important",
                  style: kStyleBlack15400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 8.r,
                  backgroundColor: kColorOrange,
                ),
                title: Text(
                  "Meeting",
                  style: kStyleBlack15400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 8.r,
                  backgroundColor: kColorGreen2,
                ),
                title: Text(
                  "Event",
                  style: kStyleBlack15400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 8.r,
                  backgroundColor: kColorPurple,
                ),
                title: Text(
                  "Work",
                  style: kStyleBlack15400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 8.r,
                  backgroundColor: kColorGreys,
                ),
                title: Text(
                  "Others",
                  style: kStyleBlack15400,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
