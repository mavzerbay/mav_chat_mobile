import 'package:flutter/material.dart';

import 'models/status_model.dart';

abstract class INetworkManager<T> {
  INetworkManager<T> addBaseUrl(String baseUrl);
  INetworkManager<T> addStatusModels(StatusModels statusModels);
  INetworkManager<T> addBaseHeader(Map<String, dynamic>? value);
  INetworkManager<T> addTimeout(int value);
  INetworkManager<T> addBuildContext(BuildContext context);
  INetworkManager<T> addLoadersOnRequest(bool withLogger);

  T build();
}
