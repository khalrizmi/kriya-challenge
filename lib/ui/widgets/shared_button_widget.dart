import 'package:flutter/material.dart';
import 'package:kriya_test/ui/shared/shared_color.dart';

class SharedButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final Function() onPressed;
  final bool isBusy;

  const SharedButtonWidget(
      {Key? key,
      required this.text,
      this.width = double.infinity,
      this.height = 60,
      this.color = SharedColors.buttonColor,
      this.textColor = SharedColors.buttonTextColor,
      required this.onPressed,
      this.isBusy = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        textColor: textColor,
        padding: const EdgeInsets.all(0),
        child: isBusy
            ? Center(
                child: Container(
                  height: 15,
                  width: 15,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              )
            : Text(
                text,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
