import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';

class CustomLoaderDialog extends StatelessWidget {
  const CustomLoaderDialog({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: SimpleDialog(
            key: key,
            backgroundColor: Colors.transparent,
            elevation: 0,
            children: <Widget>[
              Center(
                child: Column(children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ApplicationConstants.kPrimaryColor),
                  ),
                  if (text != null) ...[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      text!,
                      style: TextStyle(color: ApplicationConstants.kPrimaryColor),
                    )
                  ],
                ]),
              )
            ]));
  }
}
