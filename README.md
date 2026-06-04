# Prime Video Clone — Flutter

Replica del homepage de **Amazon Prime Video** desarrollada con Flutter como actividad del curso **Aplicaciones Móviles Multiplataforma**. La aplicación reproduce fielmente el diseño oficial: fondo negro profundo, hero con gradiente, sección de beneficios responsiva, navbar adaptativo y sistema de rutas nombradas.

---

## Tabla de contenidos

1. [Vista general](#vista-general)
2. [Características implementadas](#características-implementadas)
3. [Estructura del proyecto](#estructura-del-proyecto)
4. [Requisitos previos](#requisitos-previos)
5. [Instalación y ejecución](#instalación-y-ejecución)
6. [Auditoría de conceptos Flutter](#auditoría-de-conceptos-flutter)
7. [Paleta de colores](#paleta-de-colores)
8. [Tipografía](#tipografía)
9. [Assets](#assets)
10. [Autor](#autor)

---

## Vista general

| Sección | Descripción |
|---|---|
| **Navbar web** | Logo + links de navegación + buscador + selector de idioma + botón *Suscribirse a Prime* |
| **Navbar móvil** | Botón *Menú ▼* con dropdown animado + logo centrado + lupa + ES |
| **Hero section** | Layout 50/50 — texto con CTA a la izquierda, imagen promocional con gradiente a la derecha |
| **Benefits section** | 3 tarjetas en fila (web) o columna (móvil) ocupando el 95% del ancho de pantalla |
| **Footer** | Logo, links legales y copyright |

---

## Características implementadas

- Diseño **dark theme** fiel al estilo de Prime Video
- Layout **responsivo** — breakpoint en `700px` para adaptar entre móvil y web/escritorio
- **Navbar adaptativo**: versión web completa y versión móvil con dropdown animado
- **Dropdown móvil**: rectángulo compacto en la esquina superior izquierda con animación de chevron y fondo semiopaco
- **Hero section**: gradiente de fusión entre imagen y fondo, botones CTA con divisor `─── o ───`
- **Benefits section**: `FractionallySizedBox(widthFactor: 0.95)` para ocupar el 95% del viewport en web
- **Sistema de rutas nombradas** hacia pantallas de Películas y Series
- **Tema global centralizado** en `AppTheme` con todos los colores y estilos del proyecto

---

## Estructura del proyecto

```
lib/
├── main.dart                          # Punto de entrada — MaterialApp + rutas
├── app/
│   └── theme/
│       └── app_theme.dart             # Tema global oscuro + paleta de colores
└── features/
    ├── home/
    │   ├── models/
    │   │   └── benefit_model.dart     # Modelo de datos para tarjetas de beneficios
    │   ├── data/
    │   │   └── home_data.dart         # Datos estáticos: navItems, benefits, featuredTitles
    │   ├── screens/
    │   │   └── home_screen.dart       # Pantalla principal + navbar + dropdown móvil
    │   └── widgets/
    │       ├── hero_section.dart      # Hero responsivo con imagen y gradiente
    │       ├── benefits_section.dart  # Layout responsivo de las 3 tarjetas
    │       ├── benefit_card.dart      # Tarjeta individual de beneficio
    │       └── home_footer.dart       # Footer con logo y links legales
    ├── movies/
    │   └── screens/
    │       └── movies_screen.dart     # Pantalla Películas (placeholder)
    └── series/
        └── screens/
            └── series_screen.dart     # Pantalla Series de TV (placeholder)

assets/
└── imagenes/
    ├── heroprincipal.jpg              # Imagen promocional del hero (Spider Noir)
    ├── logoprime.png                  # Logo de Prime Video
    ├── disfruta.png                   # Ícono beneficio — Disfruta en cualquier lugar
    ├── descargadisfruta.png           # Ícono beneficio — Descarga y disfruta
    └── ahorrodatos.png                # Ícono beneficio — Ahorro de datos
```

---

## Requisitos previos

| Herramienta | Versión mínima |
|---|---|
| Flutter SDK | 3.22+ |
| Dart SDK | 3.4+ |
| Android Studio / VS Code | Cualquier versión reciente |
| Dispositivo / emulador | Android, iOS, Web o Windows |

Verifica tu instalación:

```bash
flutter doctor
```

---

## Instalación y ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/Josue-Zapata-v/prime-video-clone.git
cd prime-video-clone
```

### 2. Instalar dependencias

```bash
flutter pub get
```

### 3. Ejecutar la aplicación

```bash
# En el emulador o dispositivo conectado
flutter run

# Específicamente en Chrome (web)
flutter run -d chrome

# Específicamente en Windows
flutter run -d windows
```

### 4. Compilar para producción (opcional)

```bash
# APK Android
flutter build apk --release

# Web
flutter build web --release
```

---

## Auditoría de conceptos Flutter

Conceptos solicitados por el curso y cómo están aplicados en el proyecto.

### ListViews

> Actualmente sin instancia activa. El `ListView.builder` que existía en el Drawer fue reemplazado por el dropdown móvil compacto. Queda disponible para implementar en `MoviesScreen` y `SeriesScreen` al agregar contenido real.

---

### ListTiles

**Archivo:** `lib/features/home/screens/home_screen.dart` — clase `_MobileDropdown`

```dart
ListTile(
  dense: true,
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
  title: Text(item['label']!),
  onTap: () => onNavigate(item['route']!),
)
```

Cada ítem de navegación del dropdown móvil (Inicio, Películas, Series de TV) es un `ListTile`.

---

### Listas y Mapas

**Archivo:** `lib/features/home/data/home_data.dart`

```dart
// Lista de Mapas — ítems de navegación
const List<Map<String, String>> navItems = [
  {'label': 'Inicio',       'route': '/'},
  {'label': 'Películas',    'route': '/peliculas'},
  {'label': 'Series de TV', 'route': '/series'},
];

// Lista de Mapas — títulos del carrusel (datos disponibles)
const List<Map<String, String>> featuredTitles = [
  {'title': 'The Boys', 'imageUrl': 'https://picsum.photos/id/11/120/180'},
  // ...
];

// Lista de objetos tipados
const List<BenefitModel> benefits = [
  BenefitModel(title: 'Disfruta en cualquier lugar', ...),
  BenefitModel(title: 'Descarga y disfruta', ...),
  BenefitModel(title: 'Ahorro de datos', ...),
];
```

**Archivo:** `lib/features/home/models/benefit_model.dart` — clase que tipifica cada elemento de la lista.

---

### Rutas

**Archivo:** `lib/main.dart`

```dart
initialRoute: '/',
routes: {
  '/':          (context) => const HomeScreen(),
  '/peliculas': (context) => const MoviesScreen(),
  '/series':    (context) => const SeriesScreen(),
},
```

**Navegación activa** desde navbar web y dropdown móvil:

```dart
Navigator.pushNamed(context, item['route']!);
```

---

### Tema Global

**Archivo:** `lib/app/theme/app_theme.dart`

```dart
class AppTheme {
  static const Color primary    = Color(0xFF00A8E1);
  static const Color background = Color(0xFF00050D);
  static const Color surface    = Color(0xFF1A2432);
  static const double navbarHeight = 72;

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.dark(primary: primary, ...),
    cardTheme: ...,
    textTheme: ...,
  );
}
```

Aplicado en `main.dart` con `theme: AppTheme.darkTheme` y referenciado en todos los widgets.

---

### Cards

**Archivo:** `lib/features/home/widgets/benefit_card.dart`

```dart
Card(
  color: AppTheme.background, // fondo igual al de la página — efecto armónico
  elevation: 0,
  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  child: Padding(
    padding: EdgeInsets.all(36),
    child: Column(
      children: [
        ClipOval(child: Image.asset(..., width: 200, height: 200)),
        Text(benefit.title,       style: TextStyle(fontSize: 22, ...)),
        Text(benefit.description, style: TextStyle(fontSize: 16, ...)),
      ],
    ),
  ),
)
```

Las 3 tarjetas de beneficios usan `Card` con `elevation: 0` y fondo idéntico al de la página para fundirse visualmente.

---

### Conceptos adicionales utilizados

| Concepto | Archivo principal | Descripción |
|---|---|---|
| `StatefulWidget` + `setState` | `home_screen.dart` | Estado `_menuOpen` para el dropdown |
| `Stack` + `Positioned` | `home_screen.dart` | Overlay del dropdown sobre el contenido |
| `AnimatedContainer` | `home_screen.dart` | Fondo blanco del botón Menú al abrirse |
| `AnimatedRotation` | `home_screen.dart` | Chevron rota 180° al abrir/cerrar |
| `MediaQuery` | múltiples archivos | Breakpoint `700px` para layout responsivo |
| `FractionallySizedBox` | `benefits_section.dart` | Sección al 95% del ancho de viewport |
| `Expanded` + `flex` | `hero_section.dart` | Split 50/50 imagen/contenido en el hero |
| `LinearGradient` | `hero_section.dart` | Fusión suave imagen→fondo en el hero |
| `IntrinsicWidth` | `hero_section.dart` | Botones del hero con mismo ancho exacto |
| `SelectionArea` | `hero_section.dart` | Texto del hero seleccionable |
| `ClipOval` | `benefit_card.dart` | Imágenes circulares en las tarjetas |
| `Wrap` | `home_footer.dart` | Links del footer se adaptan en pantallas pequeñas |
| `GestureDetector` + `HitTestBehavior.opaque` | `home_screen.dart` | Cerrar dropdown al tocar fuera |
| `PreferredSize` | `home_screen.dart` | AppBars personalizados con control total del layout |
| `Image.asset` | múltiples archivos | Imágenes locales desde `assets/imagenes/` |
| `Image.network` | `home_data.dart` | URLs de picsum.photos para thumbnails |

---

## Paleta de colores

### Colores del tema global

| Token | Hex | Uso |
|---|---|---|
| `primary` | `#00A8E1` | Botones CTA, íconos activos, links, chevron |
| `background` | `#00050D` | Fondo general de toda la app |
| `surface` | `#1A2432` | Fondo de cards (tema), fallback de imágenes |
| `textPrimary` | `#FFFFFF` | Títulos y textos principales |
| `textSecondary` | `#B3B3B3` | Descripciones y subtextos |

### Colores directos en widgets

| Hex / valor | Archivo | Uso |
|---|---|---|
| `#0A0E14` | `home_footer.dart`, `home_screen.dart` | Fondo del footer y del dropdown móvil |
| `#0A0E14` al 94% (`0xF0...`) | `home_screen.dart` | Dropdown semiopaco |
| `Colors.white38` | `hero_section.dart` | Líneas del divisor `─── o ───` |
| `Colors.white60` | `hero_section.dart` | Texto central "o" del divisor |
| `Colors.white12` | `home_screen.dart` | Separadores `Divider` del dropdown |
| `Colors.black` | `home_screen.dart` | Texto del botón Menú cuando está abierto |

### Esquema visual

```
#00050D  ██████  Fondo principal     (negro con tinte azul profundo)
#0A0E14  ██████  Footer / Dropdown   (un paso más claro que el fondo)
#1A2432  ██████  Surface             (azul oscuro — fallbacks y cards tema)
#00A8E1  ██████  Prime Teal          (color de marca Amazon Prime Video)
#FFFFFF  ██████  Blanco              (textos y botones primarios)
#B3B3B3  ██████  Gris medio          (textos secundarios / descripciones)
```

---

## Tipografía

### Fuente referenciada en el código

| Fuente | Archivo | Estado |
|---|---|---|
| `Amazon Ember` | `hero_section.dart` | Referenciada pero **no instalada** — Flutter usa el fallback del sistema operativo |

### Fallback activo por plataforma

| Plataforma | Fuente que se renderiza |
|---|---|
| Android | **Roboto** |
| iOS / macOS | **SF Pro** |
| Windows | **Segoe UI** |
| Web | **Roboto** (Material Design default) |

> Para instalar `Amazon Ember` se requiere descargar los archivos `.ttf` y declararlos en `pubspec.yaml` bajo la sección `fonts:`. Una alternativa de código abierto visualmente similar es **Inter** o **Figtree**, ambas disponibles en Google Fonts.

---

## Assets

Todas las imágenes están en `assets/imagenes/` y declaradas en `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/imagenes/
```

| Archivo | Uso en la app |
|---|---|
| `heroprincipal.jpg` | Imagen del hero — grid de títulos + Spider Noir (Prime Original) |
| `logoprime.png` | Logo de Prime Video en navbar y footer |
| `disfruta.png` | Ícono circular — tarjeta "Disfruta en cualquier lugar" |
| `descargadisfruta.png` | Ícono circular — tarjeta "Descarga y disfruta" |
| `ahorrodatos.png` | Ícono circular — tarjeta "Ahorro de datos" |

---

## Autor

**Josue Zapata**
Curso: *Aplicaciones Móviles Multiplataforma* — TECSUP
GitHub: [@Josue-Zapata-v](https://github.com/Josue-Zapata-v)
