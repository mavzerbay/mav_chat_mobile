enum NetworkRoutes {REGISTER,LOGIN,MESSAGES,USERS}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.REGISTER:
        return "/Account/Register";
      case NetworkRoutes.LOGIN:
        return "/Account/Login";
      case NetworkRoutes.MESSAGES:
        return "/Messages";
      case NetworkRoutes.USERS:
        return "/Users";
      default:
        throw Exception("Routes Not Found");
    }
  }
}