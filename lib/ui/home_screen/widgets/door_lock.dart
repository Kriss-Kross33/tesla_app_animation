import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/utils.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    super.key,
    required this.isLock,
    required Duration defaultDuration,
    required this.onTap,
  }) : _defaultDuration = defaultDuration;

  final Duration _defaultDuration;
  final bool isLock;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        duration: _defaultDuration,
        child: isLock
            ? SvgPicture.asset(
                AssetConsts.doorLock,
                key: const ValueKey('doorLock'),
              )
            : SvgPicture.asset(
                AssetConsts.doorUnlock,
                key: const ValueKey('doorUnlock'),
              ),
      ),
    );
  }
}
