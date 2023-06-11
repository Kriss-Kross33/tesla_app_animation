import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_car_animation/models/models.dart';
import 'package:tesla_car_animation/ui/home_screen/widgets/widgets.dart';

import '../../controllers/controllers.dart';
import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  late HomeController _homeController;
  late AnimationController _batteryAnimationController;
  late AnimationController _tempAnimationController;
  late Animation<double> _batteryAnimation;
  late Animation<double> _batteryStatusAnimation;
  late Animation<double> _carShiftAnimation;
  late Animation<double> _tempInfoAnimation;
  late Animation<double> _coolGlowAnimation;
  late AnimationController _tyreAnimationController;
  late Animation<double> _tyreInfoPsi1Animation;
  late Animation<double> _tyreInfoPsi2Animation;
  late Animation<double> _tyreInfoPsi3Animation;
  late Animation<double> _tyreInfoPsi4Animation;

  late List<Animation<double>> _tyreInfoAnimations;

  final Duration _defaultDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _homeController = HomeController();
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _tempAnimationController =
        AnimationController(vsync: this, duration: _defaultDuration);
    _batteryAnimation = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0, 0.5),
    );
    _batteryStatusAnimation = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0.6, 1.0),
    );
    _carShiftAnimation = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.2, 0.4),
    );
    _tempInfoAnimation = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.6, 0.8),
    );
    _coolGlowAnimation = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.6, 0.8),
    );
    _tyreAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _tyreInfoPsi1Animation = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.34, 0.5),
    );
    _tyreInfoPsi2Animation = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.5, 0.66),
    );
    _tyreInfoPsi3Animation = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.66, 0.82),
    );
    _tyreInfoPsi4Animation = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.82, 1),
    );
    _tyreInfoAnimations = [
      _tyreInfoPsi1Animation,
      _tyreInfoPsi2Animation,
      _tyreInfoPsi3Animation,
      _tyreInfoPsi4Animation,
    ];
  }

  @override
  void dispose() {
    _homeController.dispose();
    _batteryAnimationController.dispose();
    _tempAnimationController.dispose();
    _tyreAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(
        [
          _homeController,
          _batteryAnimationController,
          _tempAnimationController,
          _tyreAnimationController,
        ],
      ),
      builder: (context, _) {
        return Scaffold(
          bottomNavigationBar: TeslaBottomNavigationBar(
              currentIndex: _homeController.currentIndex,
              onTap: (int index) async {
                if (index == 1) {
                  _batteryAnimationController.forward();
                } else if (_homeController.currentIndex == 1 && index != 1) {
                  _batteryAnimationController.reverse(from: 0.7);
                }
                if (index == 2) {
                  _tempAnimationController.forward();
                } else if (_homeController.currentIndex == 2 && index != 2) {
                  _tempAnimationController.reverse(from: 0.4);
                }
                if (index == 3) {
                  await Future.delayed(const Duration(milliseconds: 400));
                  _tyreAnimationController.forward();
                  _homeController.updateShowTires(true);
                  // _homeController.updateShowTyreInfo(true);
                } else if (_homeController.currentIndex == 3 && index != 3) {
                  _tyreAnimationController.reverse();
                  _homeController.updateShowTires(false);
                  // _homeController.updateShowTyreInfo(false);
                }
                _homeController.updateBottomNavTabIndex(index);
              }),
          body: SafeArea(
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                  ),
                  AnimatedPositioned(
                    left: constraints.maxWidth * 0.5 * _carShiftAnimation.value,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    duration: _defaultDuration,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.1),
                      child: SvgPicture.asset(
                        AssetConsts.car,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  LockTabWidget(
                    duration: _defaultDuration,
                    onTap: _homeController.updateLeftDoorLock,
                    left: _homeController.currentIndex == 1
                        ? constraints.maxWidth * 0.5
                        : constraints.maxWidth * 0.05,
                    isLock: _homeController.isLeftDoorLock,
                    opacity: _homeController.currentIndex != 0 ? 0 : 1,
                  ),
                  LockTabWidget(
                    duration: _defaultDuration,
                    onTap: _homeController.updateRightDoorLock,
                    right: _homeController.currentIndex == 1
                        ? constraints.maxWidth * 0.5
                        : constraints.maxWidth * 0.05,
                    isLock: _homeController.isRightDoorLock,
                    opacity: _homeController.currentIndex != 0 ? 0 : 1,
                  ),
                  LockTabWidget(
                    duration: _defaultDuration,
                    onTap: _homeController.updateBonetLock,
                    top: _homeController.currentIndex == 1
                        ? constraints.maxHeight * 1
                        : constraints.maxHeight * 0.14,
                    isLock: _homeController.isBonetDoorLock,
                    opacity: _homeController.currentIndex != 0 ? 0 : 1,
                  ),
                  LockTabWidget(
                    duration: _defaultDuration,
                    onTap: _homeController.updateBootLock,
                    bottom: _homeController.currentIndex == 1
                        ? constraints.maxHeight * 0.7
                        : constraints.maxHeight * 0.18,
                    opacity: _homeController.currentIndex != 0 ? 0 : 1,
                    isLock: _homeController.isBootDoorLock,
                  ),
                  AnimatedOpacity(
                    opacity: _batteryAnimation.value,
                    duration: const Duration(milliseconds: 600),
                    child: SvgPicture.asset(
                      AssetConsts.battery,
                      width: constraints.maxWidth * 0.45,
                    ),
                  ),
                  Positioned(
                    top: 50 * (1 - _batteryStatusAnimation.value),
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: AnimatedOpacity(
                      duration: Duration.zero,
                      opacity: _batteryStatusAnimation.value,
                      child: BatteryStatus(
                        height: constraints.maxHeight,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    top: 60 * (1 - _tempInfoAnimation.value),
                    left: 0,
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: AnimatedOpacity(
                      duration: Duration.zero,
                      opacity: _tempInfoAnimation.value,
                      child: TempDetails(homeController: _homeController),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 600),
                    right: -180 * (1 - _coolGlowAnimation.value),
                    width: 200,
                    child: _homeController.isCoolSelected
                        ? Image.asset(
                            AssetConsts.coolGlow,
                            key: UniqueKey(),
                          )
                        : Image.asset(AssetConsts.hotGlow, key: UniqueKey()),
                  ),
                  //* Tyre
                  if (_homeController.showTyres) ...tyres(constraints),
                  if (_homeController.showTyreInfo)
                    GridView.builder(
                      itemCount: 4,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          crossAxisCount: 2,
                          childAspectRatio:
                              constraints.maxWidth / constraints.maxHeight),
                      itemBuilder: (context, index) => ScaleTransition(
                        scale: _tyreInfoAnimations[index],
                        child: TyrePsiCard(
                          isBottomTyre: index > 1,
                          tyrePsi: psiList[index],
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
