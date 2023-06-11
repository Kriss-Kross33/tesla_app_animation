import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_car_animation/utils/utils.dart';

class TeslaBottomNavigationBar extends StatelessWidget {
  TeslaBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      currentIndex: currentIndex,
      items: List.generate(
        icons.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icons[index],
            colorFilter: ColorFilter.mode(
              currentIndex == index
                  ? AppConstants.primaryColor
                  : Colors.white54,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
      ),
    );
  }

  final List<String> icons = [
    AssetConsts.lock,
    AssetConsts.charge,
    AssetConsts.temp,
    AssetConsts.tyre,
  ];
}
