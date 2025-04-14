import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isLight;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.isLight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: isLight ? Colors.white : const Color(AppConstants.textColorValue),
            letterSpacing: 1,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(
            subtitle!,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              color: isLight ? Colors.white.withOpacity(0.8) : const Color(AppConstants.textColorValue).withOpacity(0.8),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ],
    );
  }
} 