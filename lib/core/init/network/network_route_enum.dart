enum NetworkRoutes {REGISTER,LOGIN}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.REGISTER:
        return "/Account/Register";
      case NetworkRoutes.LOGIN:
        return "/Account/Login";
      default:
        throw Exception("Routes Not Found");
    }
  }
}