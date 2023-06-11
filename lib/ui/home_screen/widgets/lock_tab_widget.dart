import 'package:flutter/material.dart';
import 'package:tesla_car_animation/ui/home_screen/widgets/widgets.dart';

class LockTabWidget extends StatelessWidget {
  const LockTabWidget({
    super.key,
    this.duration = Duration.zero,
    this.left,
    this.right,
    this.top,
    this.bottom,
    required this.isLock,
    required this.onTap,
    required this.opacity,
  });

  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final bool isLock;
  final VoidCallback onTap;
  final Duration duration;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      left: left,
      top: top,
      bottom: bottom,
      right: right,
      child: AnimatedOpacity(
        duration: duration,
        opacity: opacity,
        child: DoorLock(
          isLock: isLock,
          onTap: onTap,
          defaultDuration: duration,
        ),
      ),
    );
  }
}
