import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';

import '../../../view/screens/chats/main/view/chats_view.dart';
import '../../../view/screens/messages/main/view/messages_view.dart';
import '../../../view/screens/sign_in/view/sign_in_view.dart';
import '../../../view/screens/sign_up/view/sign_up_view.dart';
import '../../../view/screens/welcome/view/welcome_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        if (args.arguments != null &&
            args.arguments is NavigationData &&
            (args.arguments as NavigationData).routeWithAnimation)
          return animatedNavigate(WelcomeView());
        else
          return normalNavigate(WelcomeView());
      case NavigationConstants.SIGN_IN:
        if (args.arguments is NavigationData &&
            (args.arguments as NavigationData).routeWithAnimation)
          return animatedNavigate(SignInView());
        else
          return normalNavigate(SignInView());
      case NavigationConstants.SIGN_UP:
        if (args.arguments != null &&
            args.arguments is NavigationData &&
            (args.arguments as NavigationData).routeWithAnimation)
          return animatedNavigate(SignUpView());
        else
          return normalNavigate(SignUpView());
      case NavigationConstants.CHATS:
        if (args.arguments != null &&
            args.arguments is NavigationData &&
            (args.arguments as NavigationData).routeWithAnimation)
          return animatedNavigate(ChatsView());
        else
          return normalNavigate(ChatsView());
      case NavigationConstants.MESSAGES:
        if (args.arguments != null &&
            args.arguments is NavigationData &&
            (args.arguments as NavigationData).routeWithAnimation)
          return animatedNavigate(MessagesView(userDto: (args.arguments as NavigationData).data as UserDto,));
        else
          return normalNavigate(MessagesView(userDto: (args.arguments as NavigationData).data as UserDto));
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }

  PageRouteBuilder animatedNavigate(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeOutQuad;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class NavigationData {
  Object? data;
  bool routeWithAnimation;

  NavigationData({
    this.data,
    this.routeWithAnimation = false,
  });
}
