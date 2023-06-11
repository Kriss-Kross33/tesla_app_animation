import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TempButton extends StatelessWidget {
  const TempButton({
    super.key,
    required this.svgSrc,
    required this.isActive,
    required this.onTap,
    required this.label,
    required this.tempColor,
  });

  final String svgSrc;
  final bool isActive;
  final VoidCallback onTap;
  final String label;
  final Color tempColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              colorFilter: ColorFilter.mode(
                isActive ? tempColor : Colors.white38,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: 16,
            color: isActive ? tempColor : Colors.white38,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
          child: Text(
            label.toUpperCase(),
          ),
        )
      ],
    );
  }
}
