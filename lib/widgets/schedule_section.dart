import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import 'section_title.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: const Color(AppConstants.backgroundColorValue),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Расписание',
            subtitle: 'План нашего дня',
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: List.generate(
                AppConstants.schedule.length,
                (index) {
                  final item = AppConstants.schedule[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(AppConstants.primaryColorValue).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              item['time']!,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: const Color(AppConstants.primaryColorValue),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(AppConstants.textColorValue),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item['description']!,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 16,
                                  color: const Color(AppConstants.textColorValue).withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: const Duration(milliseconds: 500)).slideX(begin: 0.3, end: 0);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
} 