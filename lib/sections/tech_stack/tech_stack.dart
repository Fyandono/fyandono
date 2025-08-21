import 'package:flutter/material.dart';
import 'package:fyandono/colors/colors.dart';
import 'package:fyandono/main.dart';
import 'package:fyandono/widgets/text.dart';

class TechCategoryWidget extends StatelessWidget {
  final String categoryName;
  final List<TechItem> items;

  const TechCategoryWidget({
    super.key,
    required this.categoryName,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: categoryName,
            fontSize: isMobile ? 28 : 36,
            color: AppColors.grey1000,
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children:
                items.map((item) => _TechCardWithLogo(item: item)).toList(),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _TechCardWithLogo extends StatefulWidget {
  final TechItem item;

  const _TechCardWithLogo({required this.item});

  @override
  State<_TechCardWithLogo> createState() => _TechCardWithLogoState();
}

class _TechCardWithLogoState extends State<_TechCardWithLogo> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color:
              _hovering
                  ? AppColors.grey100
                  : AppColors.grey100.withValues(alpha: 0.75),
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              _hovering
                  ? [
                    BoxShadow(
                      color: AppColors.grey200,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ]
                  : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(widget.item.logoAsset, width: 32, height: 32),
            const SizedBox(width: 12),
            MyText(
              text: widget.item.name,
              fontSize: isMobile(context) ? 20 : 24,
              color: AppColors.grey1000,
            ),
          ],
        ),
      ),
    );
  }
}

// Tech item model
class TechItem {
  final String name;
  final String logoAsset;

  TechItem({required this.name, required this.logoAsset});
}
