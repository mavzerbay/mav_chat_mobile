enum NetworkRoutes {REGISTER,LOGIN,MESSAGES}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.REGISTER:
        return "/Account/Register";
      case NetworkRoutes.LOGIN:
        return "/Account/Login";
      case NetworkRoutes.MESSAGES:
        return "/Messages";
      default:
        throw Exception("Routes Not Found");
    }
  }
}