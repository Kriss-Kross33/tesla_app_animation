import 'package:flutter/material.dart';
import 'package:tesla_car_animation/ui/home_screen/widgets/widgets.dart';
import 'package:tesla_car_animation/utils/utils.dart';

import '../../../controllers/controllers.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required HomeController homeController,
  }) : _homeController = homeController;

  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempButton(
                  label: 'cool',
                  onTap: _homeController.updateIsCoolSelected,
                  isActive: _homeController.isCoolSelected,
                  svgSrc: AssetConsts.coolShape,
                  tempColor: AppConstants.primaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                TempButton(
                  label: 'heat',
                  onTap: _homeController.updateIsCoolSelected,
                  isActive: !_homeController.isCoolSelected,
                  svgSrc: AssetConsts.coolShape,
                  tempColor: AppConstants.redColor,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_up,
                  size: 40,
                ),
              ),
              const Text(
                '29' '\u2103',
                style: TextStyle(fontSize: 86),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 40,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text('current temperature'.toUpperCase()),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Inside'.toUpperCase()),
                  Text(
                    '20' '\u2103',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inside'.toUpperCase(),
                    style: const TextStyle(color: Colors.white54),
                  ),
                  Text(
                    '35' '\u2103',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white54),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
