import 'package:flutter/material.dart';
import '../../../app/theme/app_theme.dart';
import '../data/home_data.dart';
import '../widgets/hero_section.dart';
import '../widgets/benefits_section.dart';
import '../widgets/home_footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: isWide ? _wideAppBar(context) : _narrowAppBar(),
      body: Stack(
        children: [
          const SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(),
                BenefitsSection(),
                HomeFooter(),
              ],
            ),
          ),
          if (!isWide && _menuOpen) ...[
            // Capa transparente que cierra al tocar fuera del dropdown
            Positioned.fill(
              child: GestureDetector(
                onTap: () => setState(() => _menuOpen = false),
                behavior: HitTestBehavior.opaque,
                child: const SizedBox.expand(),
              ),
            ),
            // Dropdown pequeño en la esquina superior izquierda
            Positioned(
              top: 0,
              left: 0,
              child: _MobileDropdown(
                onNavigate: (route) {
                  setState(() => _menuOpen = false);
                  if (route != '/') Navigator.pushNamed(context, route);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ── Navbar móvil: Menú ▼ | logo centrado | lupa + ES ─────────────────────────
  PreferredSizeWidget _narrowAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(AppTheme.navbarHeight),
      child: Container(
        color: AppTheme.background,
        height: AppTheme.navbarHeight,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Botón Menú con chevron animado
            GestureDetector(
              onTap: () => setState(() => _menuOpen = !_menuOpen),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: _menuOpen ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Menú',
                      style: TextStyle(
                        color: _menuOpen ? Colors.black : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 2),
                    AnimatedRotation(
                      turns: _menuOpen ? 0.5 : 0,
                      duration: const Duration(milliseconds: 150),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: _menuOpen ? Colors.black : Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Logo centrado
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/imagenes/logoprime.png',
                  height: 22,
                  errorBuilder: (_, __, ___) => const Text(
                    'prime video',
                    style: TextStyle(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            // Lupa
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white, size: 22),
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 12),
            // ES
            const Text(
              'ES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Navbar web: logo + links + acciones ───────────────────────────────────────
  PreferredSizeWidget _wideAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(AppTheme.navbarHeight),
      child: Container(
        color: AppTheme.background,
        height: AppTheme.navbarHeight,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imagenes/logoprime.png',
              height: 22,
              errorBuilder: (_, __, ___) => const Text(
                'prime video',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 36),
            ...navItems.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextButton(
                  onPressed: () {
                    if (item['route'] != '/') {
                      Navigator.pushNamed(context, item['route']!);
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    overlayColor: Colors.white12,
                  ),
                  child: Text(
                    item['label']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white, size: 22),
              onPressed: () {},
              splashRadius: 20,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('ES',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  Icon(Icons.arrow_drop_down,
                      color: Colors.white, size: 18),
                ],
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Suscribirse a Prime',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Dropdown compacto del menú móvil ─────────────────────────────────────────
class _MobileDropdown extends StatelessWidget {
  final void Function(String) onNavigate;

  const _MobileDropdown({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: const BoxDecoration(
        color: Color(0xF00A0E14),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...navItems.map(
            (item) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 2),
                  title: Text(
                    item['label']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () => onNavigate(item['route']!),
                ),
                const Divider(
                  color: Colors.white12,
                  height: 1,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Suscribirse a Prime',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
