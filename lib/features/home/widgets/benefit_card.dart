import 'package:flutter/material.dart';
import '../../../app/theme/app_theme.dart';
import '../models/benefit_model.dart';

class BenefitCard extends StatelessWidget {
  final BenefitModel benefit;

  const BenefitCard({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: AppTheme.background,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                benefit.imagePath,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.surface,
                  ),
                  child: const Icon(
                    Icons.play_circle_outline,
                    color: AppTheme.primary,
                    size: 64,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              benefit.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            Text(
              benefit.description,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 16,
                height: 1.55,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
