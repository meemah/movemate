import 'package:flutter/material.dart';

import '../util/theme/app_colors/app_colors.dart';

class ScanReceiptContainer extends StatelessWidget {
  const ScanReceiptContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: AppColors.pending, shape: BoxShape.circle),
      child: const Icon(
        Icons.qr_code_scanner,
        color: Colors.white,
      ),
    );
  }
}
