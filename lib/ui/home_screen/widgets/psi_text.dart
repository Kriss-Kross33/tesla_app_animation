import 'package:flutter/material.dart';

class PsiText extends StatelessWidget {
  const PsiText({
    super.key,
    required this.psi,
  });

  final String psi;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: psi,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
        children: const [
          TextSpan(
            text: 'psi',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
