import 'package:flutter/material.dart';
import 'package:mav_chat/core/init/navigation/navigation_service.dart';

import 'models/status_model.dart';

abstract class INetworkManager<T> {
  INetworkManager<T> addBaseUrl(String baseUrl);
  INetworkManager<T> addStatusModels(StatusModels statusModels);
  INetworkManager<T> addBaseHeader(Map<String, dynamic>? value);
  INetworkManager<T> addTimeout(int value);
  INetworkManager<T> addBuildContext(BuildContext context);
  INetworkManager<T> addLoadersOnRequest();
  INetworkManager<T> addNavigationService(NavigationService navigationService);

  T build();
}
