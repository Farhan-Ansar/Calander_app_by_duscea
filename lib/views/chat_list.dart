import 'package:duseca_calender_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../AppConstant/app_constant.dart';
import '../Resources/Components/custom_app_bar.dart';
import '../Resources/Components/message_comp.dart';
import '../Resources/Components/my_drawer.dart';
import '../models/message_model.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final _advancedDrawerController = AdvancedDrawerController();
  final List<Message> messages = [
    Message(
      imagePath: "assets/images/User11.svg",
      title: 'Alphaboard',
      description: 'Jane: Hello, Mark! I am wr...',
      messageNumber: 3,
    ),
    Message(
      imagePath: "assets/images/User12.svg",
      title: 'Project Update',
      description: 'Mike: Don\'t meeting ......',
    ),
    Message(
      imagePath: "assets/images/User13.svg",
      title: 'Alphaboard',
      description: 'Jane: Hello, Mark! I am wr...',
      messageNumber: 3,
    ),
    Message(
      imagePath: "assets/images/User3.svg",
      title: 'Project Update',
      description: 'Mike: Don\'t at 3 PM.',
    ),
    Message(
      imagePath: "assets/images/User.svg",
      title: 'Alphaboard',
      description: 'Jane: Hello, am wr...',
    ),
    Message(
      imagePath: "assets/images/User3.svg",
      title: 'Project Update',
      description: 'Mike: Don\'t  3 PM.',
    ),
    // Add more messages as needed
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdvancedDrawer(
        backdropColor: kColorBackGround,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 100),
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        drawer: MyDrawer(),
        child: Scaffold(
          backgroundColor: kColorBackGround,
          appBar: CustomAppBar(
            controller: _advancedDrawerController,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(
                  color: kColorGrey,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/Search.svg"),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Search...",
                        style: kStyleGrey15600,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: kColorGrey,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "PINNED",
                      style: kStyleGrey15600,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.chatScreen);
                  },
                  child: const MessageCard(
                    imagePath: "assets/images/User.svg",
                    title: 'Alphaboard',
                    description: 'Jane: Hello,I am wr...',
                    messageNumber: 8,
                  ),
                ),
                const MessageCard(
                  imagePath: "assets/images/User1.svg",
                  title: 'Alphaboard',
                  description: 'Jane: Hello, Mark! I am wr...',
                  messageNumber: 3,
                ),
                const MessageCard(
                  imagePath: "assets/images/User3.svg",
                  title: 'Alphaboard',
                  description: 'Jane: Hello, I am wr...',
                  messageNumber: 5,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "ALL MESSAGES",
                      style: kStyleGrey15600,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return MessageCard(
                      imagePath: message.imagePath,
                      title: message.title,
                      description: message.description,
                      messageNumber: message.messageNumber,
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
