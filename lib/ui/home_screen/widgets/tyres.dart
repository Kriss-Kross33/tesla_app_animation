import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_car_animation/utils/utils.dart';

List<Widget> tyres(BoxConstraints constraints) {
  return [
    Positioned(
      left: constraints.maxWidth * 0.21,
      top: constraints.maxHeight * 0.2,
      child: SvgPicture.asset(AssetConsts.flTyre),
    ),
    Positioned(
      right: constraints.maxWidth * 0.21,
      top: constraints.maxHeight * 0.2,
      child: SvgPicture.asset(AssetConsts.flTyre),
    ),
    Positioned(
      right: constraints.maxWidth * 0.23,
      top: constraints.maxHeight * 0.2,
      child: SvgPicture.asset(AssetConsts.flTyre),
    ),
    Positioned(
      left: constraints.maxWidth * 0.21,
      top: constraints.maxHeight * 0.62,
      child: SvgPicture.asset(AssetConsts.flTyre),
    ),
    Positioned(
      right: constraints.maxWidth * 0.21,
      top: constraints.maxHeight * 0.62,
      child: SvgPicture.asset(AssetConsts.flTyre),
    ),
  ];
}
