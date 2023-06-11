import 'package:flutter/material.dart';
import 'package:tesla_car_animation/models/models.dart';
import 'package:tesla_car_animation/ui/home_screen/widgets/widgets.dart';

import '../../../utils/utils.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    super.key,
    required this.isBottomTyre,
    required this.tyrePsi,
  });

  final bool isBottomTyre;
  final TyrePsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: tyrePsi.isLowPressure
            ? AppConstants.redColor.withOpacity(0.1)
            : Colors.white10,
        border: Border.all(
            color: tyrePsi.isLowPressure
                ? AppConstants.redColor
                : AppConstants.primaryColor,
            width: 2),
      ),
      child: isBottomTyre
          ? Column(
              children: [
                const LowPressureSection(),
                const Spacer(),
                PsiText(
                  psi: tyrePsi.psi.toString(),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '${tyrePsi.temp}\u2103',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            )
          : const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PsiText(
                  psi: '23.6',
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '41\u2103',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                LowPressureSection(),
              ],
            ),
    );
  }
}
