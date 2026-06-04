import 'package:flutter/material.dart';
import '../../../app/theme/app_theme.dart';

const Color _bg = Color(0xFF00050D);
const String _fontFamily = 'Amazon Ember';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 700;

    return Container(
      width: double.infinity,
      color: _bg,
      child: isWide ? const _WideHero() : const _NarrowHero(),
    );
  }
}

// ── Layout ancho: ocupa toda la pantalla visible (viewport - appbar) ──────────
class _WideHero extends StatelessWidget {
  const _WideHero();

  @override
  Widget build(BuildContext context) {
    final heroHeight = MediaQuery.of(context).size.height - AppTheme.navbarHeight;

    return SizedBox(
      height: heroHeight,
      child: Row(
        children: [
          // Mitad izquierda: contenido (flex 3 = 50% del ancho)
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
              child: const _HeroContent(),
            ),
          ),
          // Mitad derecha: imagen (flex 3 = 50% del ancho)
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/imagenes/heroprincipal.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  errorBuilder: (_, __, ___) => const ColoredBox(color: _bg),
                ),
                // Sombra: fusiona el 1/4 izquierdo de la imagen con el fondo
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [_bg, Colors.transparent],
                      stops: [0.0, 0.18],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Layout móvil ──────────────────────────────────────────────────────────────
class _NarrowHero extends StatelessWidget {
  const _NarrowHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 260,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/imagenes/heroprincipal.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (_, __, ___) => const ColoredBox(color: _bg),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, _bg],
                    stops: [0.4, 1.0],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 40),
          child: _HeroContent(),
        ),
      ],
    );
  }
}

// ── Contenido: título, subtítulo, botones, disclaimer ────────────────────────
class _HeroContent extends StatelessWidget {
  const _HeroContent();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Título: 44px, línea cortada como en Prime Video
        const Text(
          'Te damos la bienvenida a',
          style: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
            height: 1.15,
          ),
        ),
        const Text(
          'Prime Video',
          style: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
            height: 1.15,
          ),
        ),
        const SizedBox(height: 20),
        // Subtítulo: 20px, líneas entrecortadas
        const Text(
  'Disfruta de títulos Amazon Originals exclusivos, además de películas y',
  softWrap: false,
  style: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    color: Color(0xFFFFFFFF),
    height: 1.6,
  ),
),
const Text(
  'series populares por PEN 25.90/mes. Disfruta ahora, cancela cuando',
  softWrap: false,
  style: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    color: Color(0xFFFFFFFF),
    height: 1.6,
  ),
),
const Text(
  'quieras.',
  softWrap: false,
  style: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    color: Color(0xFFFFFFFF),
    height: 1.6,
  ),
),
        const SizedBox(height: 32),

        // Botón 1 + divisor + Botón 2 comparten el mismo ancho (el del botón más largo)
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Botón 1
              // padding → vertical: grosor | horizontal: ancho interno
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF00050D),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  '¿Eres miembro de Prime Video? Inicia sesión',
                  style: TextStyle(
                    fontFamily: _fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF00050D),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Divisor ─── o ─── (mismo ancho que los botones)
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.white38, thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'o',
                      style: TextStyle(
                        fontFamily: _fontFamily,
                        fontSize: 16,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.white38, thickness: 1)),
                ],
              ),

              const SizedBox(height: 16),

              // Botón 2
              // padding → vertical: grosor | horizontal: ancho interno
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF00050D),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Comienza tu prueba gratis',
                  style: TextStyle(
                    fontFamily: _fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00050D),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // Disclaimer
        const Text(
          '*Cancela tu prueba cuando quieras.',
          style: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 14,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ],
    ),
    );
  }
}
