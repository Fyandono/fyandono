import 'package:flutter/material.dart';
import 'package:fyandono/colors/colors.dart';
import 'package:fyandono/widgets/text.dart';

class ExperienceCard extends StatelessWidget {
  final String companyName;
  final String logoAsset;
  final String duration;
  final String description;

  const ExperienceCard({
    super.key,
    required this.companyName,
    required this.logoAsset,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey200,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Logo
          Image.asset(
            logoAsset,
            width: isMobile ? 48 : 64,
            height: isMobile ? 48 : 64,
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: companyName,
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey1000,
                ),
                const SizedBox(height: 4),
                MyText(
                  text: duration,
                  fontSize: isMobile ? 14 : 16,
                  color: AppColors.grey600,
                ),
                const SizedBox(height: 12),
                MyText(
                  text: description,
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey1000,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
