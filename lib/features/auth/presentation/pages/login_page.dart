import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:libease_app/core/theme/app_theme.dart';
import 'package:libease_app/features/books/presentation/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Selamat Datang\nKembali!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ).animate().fade(duration: 600.ms).slideX(begin: -0.2),
              const SizedBox(height: 10),
              Text(
                'Masuk untuk melanjutkan ke LibEase',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ).animate().fade(duration: 600.ms, delay: 200.ms),
              const SizedBox(height: 50),
              _buildTextField(
                label: 'Username',
                hint: 'Masukkan username',
                icon: Icons.person_outline_rounded,
              ).animate().fade(duration: 600.ms, delay: 400.ms),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Password',
                hint: 'Masukkan password',
                icon: Icons.lock_outline_rounded,
                isPassword: true,
              ).animate().fade(duration: 600.ms, delay: 600.ms),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  'Masuk',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ).animate().fade(duration: 600.ms, delay: 800.ms).scale(),
              const SizedBox(height: 30),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Lupa Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: AppTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}
