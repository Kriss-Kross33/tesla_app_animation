import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool isLeftDoorLock = true;
  bool isRightDoorLock = true;
  bool isBonetDoorLock = true;
  bool isBootDoorLock = true;

  int currentIndex = 0;

  bool isCoolSelected = true;
  bool showTyres = false;

  bool showTyreInfo = false;

  void updateBottomNavTabIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updateBonetLock() {
    isBonetDoorLock = !isBonetDoorLock;
    notifyListeners();
  }

  void updateBootLock() {
    isBootDoorLock = !isBootDoorLock;
    notifyListeners();
  }

  void updateIsCoolSelected() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  void updateShowTires(bool showTyres) {
    this.showTyres = showTyres;
    notifyListeners();
  }

  void updateShowTyreInfo(bool showTyreInfo) {
    this.showTyreInfo = showTyreInfo;
    notifyListeners();
  }
}
