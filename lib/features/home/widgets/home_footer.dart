import 'package:flutter/material.dart';
import '../../../app/theme/app_theme.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0A0E14),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        children: [
          Image.asset(
            'assets/imagenes/logoprime.png',
            height: 40,
            errorBuilder: (_, __, ___) => const Text(
              'prime video',
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 8,
            children: const [
              _FooterLink('Términos y Aviso de privacidad'),
              _FooterLink('Envíanos tus comentarios'),
              _FooterLink('Ayuda'),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '© 1996-2026, Amazon.com, Inc. o sus filiales',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;

  const _FooterLink(this.label);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        label,
        style: const TextStyle(
          color: AppTheme.primary,
          fontSize: 12,
          decoration: TextDecoration.underline,
          decorationColor: AppTheme.primary,
        ),
      ),
    );
  }
}
