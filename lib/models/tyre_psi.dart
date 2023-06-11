class TyrePsi {
  TyrePsi({
    required this.psi,
    required this.temp,
    required this.isLowPressure,
  });

  final double psi;
  final int temp;
  final bool isLowPressure;
}

final List<TyrePsi> psiList = [
  TyrePsi(psi: 23.6, temp: 56, isLowPressure: true),
  TyrePsi(psi: 35.0, temp: 41, isLowPressure: false),
  TyrePsi(psi: 34.6, temp: 41, isLowPressure: false),
  TyrePsi(psi: 24.8, temp: 42, isLowPressure: false),
];
