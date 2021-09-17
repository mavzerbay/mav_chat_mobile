import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox({
    Key? key,
    required this.title,
    required this.acceptButtonText,
    this.descriptions,
    this.rejectButtonText,
    this.image,
    this.icon,
    this.iconColor,
    this.acceptButtonFunc,
    this.rejectButtonFunc,
  }) : super(key: key);

  final String title, acceptButtonText;
  final String? descriptions, rejectButtonText;
  final Image? image;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? acceptButtonFunc, rejectButtonFunc;

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 20,
            top: widget.image == null && widget.icon == null ? 20 : 65,
            right: 20,
            bottom: 20,
          ),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              if (widget.descriptions != null) ...[
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.descriptions!,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: widget.rejectButtonText != null ? MainAxisAlignment.end:MainAxisAlignment.center,
                  children: [
                    if (widget.rejectButtonText != null) ...[
                      TextButton(
                        onPressed: widget.rejectButtonFunc == null
                            ? () => Navigator.of(context).pop()
                            : widget.rejectButtonFunc,
                        child: Text(
                          widget.rejectButtonText!,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                    TextButton(
                      onPressed: widget.acceptButtonFunc == null
                          ? () => Navigator.of(context).pop()
                          : widget.acceptButtonFunc,
                      child: Text(
                        widget.acceptButtonText,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (widget.image != null || widget.icon != null) ...[
          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: widget.icon != null && widget.iconColor != null
                  ? widget.iconColor
                  : Colors.transparent,
              radius: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                child: widget.image != null
                    ? widget.image
                    : Icon(
                        widget.icon!,
                        size: 50,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
