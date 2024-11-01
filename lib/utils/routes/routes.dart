import 'package:duseca_calender_app/utils/routes/routes_name.dart';
import 'package:duseca_calender_app/views/chat_list.dart';
import 'package:duseca_calender_app/views/chat_screen.dart';
import 'package:duseca_calender_app/views/home_screen.dart';
import 'package:duseca_calender_app/views/overView_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.chatListScreen:
        return MaterialPageRoute(builder: (_) => const ChatList());
      case RoutesName.chatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case RoutesName.overViewScreen:
        return MaterialPageRoute(builder: (_) => const OverviewScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
