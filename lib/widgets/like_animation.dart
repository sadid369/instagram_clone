// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LikeAnimation extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smallLike;
  const LikeAnimation({
    super.key,
    required this.child,
    required this.isAnimating,
    required this.duration,
    this.onEnd,
    this.smallLike = false,
  });

  @override
  _LikeAnimationState createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.duration.inMilliseconds ~/ 2,
      ),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(animationController);
  }

  // @override
  // void didUpdateWidget(covariant LikeAnimation oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if(widget.isAnimating != oldWidget.isAnimating){
  //     startAni
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
