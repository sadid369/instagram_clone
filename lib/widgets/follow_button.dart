import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  final Function()? function;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;

  const FollowButton({
    Key? key,
    this.function,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: TextButton(
        onPressed: widget.function,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(
              color: widget.borderColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          width: 250,
          height: 27,
        ),
      ),
    );
  }
}
