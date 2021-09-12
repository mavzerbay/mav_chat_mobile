import 'package:flutter/material.dart';
import 'package:mav_chat/core/constants/app/app_constants.dart';
import 'package:mav_chat/core/extensions/context_extension.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.title,
    this.hasBorder = false,
    this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  final String title;
  final bool hasBorder;
  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder
              ? context.theme.scaffoldBackgroundColor
              : ApplicationConstants.kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(color: ApplicationConstants.kPrimaryColor, width: 1)
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: context.size60,
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(ApplicationConstants.kPrimaryColor),
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        color: hasBorder
                            ? ApplicationConstants.kPrimaryColor
                            : context.theme.scaffoldBackgroundColor,
                        fontWeight: FontWeight.w600,
                        fontSize: context.size20,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
