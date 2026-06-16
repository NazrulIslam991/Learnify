import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingModel {
  final IconData icon;
  final String title;
  final String description;

  OnboardingModel({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class OnboardingNotifier extends Notifier<int> {
  @override
  int build() => 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      icon: Icons.qr_code_scanner,
      title: "Scan Any Text",
      description:
          "Point your camera at any printed or handwritten text and let Scanthesis AI do the heavy lifting.",
    ),
    OnboardingModel(
      icon: Icons.psychology,
      title: "AI Understands It",
      description:
          "Our neural engine extracts meaning, key concepts, and relationships from your scanned content instantly.",
    ),
    OnboardingModel(
      icon: Icons.bolt,
      title: "Learn Faster",
      description:
          "AI-generated Q&A cards, summaries, and chat assistance accelerate your mastery of any subject.",
    ),
    OnboardingModel(
      icon: Icons.library_books,
      title: "Build Your Library",
      description:
          "Every scan becomes a knowledge card saved in your personal study library — always searchable, always accessible.",
    ),
  ];

  void setPage(int index) => state = index;
}

/// NotifierProvider
final onboardingProvider = NotifierProvider<OnboardingNotifier, int>(() {
  return OnboardingNotifier();
});
