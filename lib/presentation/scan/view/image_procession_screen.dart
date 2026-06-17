import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageProcessionScreen extends StatefulWidget {
  const ImageProcessionScreen({super.key});

  @override
  State<ImageProcessionScreen> createState() => _ImageProcessionScreenState();
}

class _ImageProcessionScreenState extends State<ImageProcessionScreen> {
  final List<String> steps = [
    "OCR Processing",
    "Text Extraction",
    "AI Analysis",
    "Generating Questions",
  ];

  int currentStep = -1;

  @override
  void initState() {
    super.initState();
    _startProcessing();
  }

  void _startProcessing() async {
    for (int i = 0; i < steps.length; i++) {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      setState(() => currentStep = i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A16),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeader(),

              const SizedBox(height: 40),

              _buildShimmerBlock(),

              const SizedBox(height: 40),

              _buildSteps(),

              const SizedBox(height: 30),

              _buildProgressBar(),
            ],
          ),
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(Icons.auto_awesome, size: 40, color: Colors.white),
        ),
        const SizedBox(height: 25),
        const Text(
          "Analyzing Your Content",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "AI is processing your scan with advanced intelligence",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white54, fontSize: 14, height: 1.4),
        ),
      ],
    );
  }

  // ================= SHIMMER BLOCK =================
  Widget _buildShimmerBlock() {
    return Column(children: List.generate(4, (index) => _line()));
  }

  Widget _line() {
    return Shimmer.fromColors(
      baseColor: Colors.white10,
      highlightColor: Colors.white24,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        height: 10,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // ================= STEPS =================
  Widget _buildSteps() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: List.generate(steps.length, (index) {
          bool active = index <= currentStep;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active ? Colors.purpleAccent : Colors.transparent,
                    border: Border.all(
                      color: active ? Colors.purpleAccent : Colors.white24,
                    ),
                  ),
                  child: active
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 12),
                Text(
                  steps[index],
                  style: TextStyle(
                    color: active ? Colors.white : Colors.white38,
                    fontSize: 15,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ================= PROGRESS BAR =================
  Widget _buildProgressBar() {
    double progress = currentStep < 0 ? 0 : (currentStep + 1) / steps.length;

    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.white10,
          valueColor: const AlwaysStoppedAnimation(Colors.purpleAccent),
          minHeight: 6,
        ),
        const SizedBox(height: 10),
        Text(
          "${(progress * 100).toInt()}% Completed",
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }
}
