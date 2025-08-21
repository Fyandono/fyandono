import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  final CompanyExperience company;
  final int roleIndex;

  const ExperienceSection({
    super.key,
    required this.company,
    required this.roleIndex,
  });

  @override
  Widget build(BuildContext context) {
    final role = company.roles[roleIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Sticky company info
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(company.logoAsset, width: 48, height: 48),
            const SizedBox(width: 12),
            Text(
              company.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Role info (changes as page changes)
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Column(
            key: ValueKey(role.title),
            children: [
              Text(role.title, style: const TextStyle(fontSize: 20)),
              Text(role.period, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 12),
              Text(role.description, textAlign: TextAlign.center),
            ],
          ),
        ),
      ],
    );
  }
}

class CompanyExperience {
  final String name;
  final String logoAsset;
  final List<Role> roles;

  CompanyExperience({
    required this.name,
    required this.logoAsset,
    required this.roles,
  });
}

class Role {
  final String title;
  final String period;
  final String description;

  Role({required this.title, required this.period, required this.description});
}
