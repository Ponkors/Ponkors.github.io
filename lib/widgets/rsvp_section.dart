import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import 'section_title.dart';

class RSVPSection extends StatefulWidget {
  const RSVPSection({super.key});

  @override
  State<RSVPSection> createState() => _RSVPSectionState();
}

class _RSVPSectionState extends State<RSVPSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _guestsController = TextEditingController();
  bool _isAttending = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _guestsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Спасибо за ответ! Мы свяжемся с вами в ближайшее время.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: const Color(AppConstants.backgroundColorValue),
      child: Column(
        children: [
          const SectionTitle(
            title: 'RSVP',
            subtitle: 'Подтвердите свое присутствие',
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Ваше имя',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите ваше имя';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Номер телефона',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите ваш номер телефона';
                      }
                      if (!value.contains('+375')) {
                        return 'Пожалуйста, введите корректный номер';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _guestsController,
                    decoration: InputDecoration(
                      labelText: 'Количество гостей',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, укажите количество гостей';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Пожалуйста, введите корректное число';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<bool>(
                          title: const Text('Приду'),
                          value: true,
                          groupValue: _isAttending,
                          onChanged: (value) {
                            setState(() {
                              _isAttending = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<bool>(
                          title: const Text('Не приду'),
                          value: false,
                          groupValue: _isAttending,
                          onChanged: (value) {
                            setState(() {
                              _isAttending = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(AppConstants.primaryColorValue),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Отправить',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 