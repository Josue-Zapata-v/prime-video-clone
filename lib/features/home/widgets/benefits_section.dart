import 'package:flutter/material.dart';
import '../data/home_data.dart';
import 'benefit_card.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    if (isWide) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.95,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: benefits
                  .map((b) => Expanded(child: BenefitCard(benefit: b)))
                  .toList(),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Column(
        children: benefits.map((b) => BenefitCard(benefit: b)).toList(),
      ),
    );
  }
}
