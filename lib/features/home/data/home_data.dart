import '../models/benefit_model.dart';

const List<BenefitModel> benefits = [
  BenefitModel(
    title: 'Disfruta en cualquier lugar',
    description:
        'Disfruta desde la web o con la app de Prime Video en tu teléfono, tablet o ciertos televisores smart TV en hasta tres dispositivos al mismo tiempo.',
    imagePath: 'assets/imagenes/disfruta.png',
  ),
  BenefitModel(
    title: 'Descarga y disfruta',
    description:
        'Disfruta de contenido sin conexión con la app de Prime Video cuando descargues títulos en tu iPhone, iPad, tablet o dispositivo Android.',
    imagePath: 'assets/imagenes/descargadisfruta.png',
  ),
  BenefitModel(
    title: 'Ahorro de datos',
    description:
        'Controla el uso de datos mientras descargas y ves videos en determinados teléfonos y tablets.',
    imagePath: 'assets/imagenes/ahorrodatos.png',
  ),
];

const List<Map<String, String>> navItems = [
  {'label': 'Inicio', 'route': '/'},
  {'label': 'Películas', 'route': '/peliculas'},
  {'label': 'Series de TV', 'route': '/series'},
];

const List<Map<String, String>> featuredTitles = [
  {'title': 'The Boys', 'imageUrl': 'https://picsum.photos/id/11/120/180'},
  {'title': 'Citadel', 'imageUrl': 'https://picsum.photos/id/22/120/180'},
  {'title': 'Jack Ryan', 'imageUrl': 'https://picsum.photos/id/33/120/180'},
  {'title': 'Reacher', 'imageUrl': 'https://picsum.photos/id/44/120/180'},
  {'title': 'Rings of Power', 'imageUrl': 'https://picsum.photos/id/55/120/180'},
  {'title': 'Casa Espíritus', 'imageUrl': 'https://picsum.photos/id/66/120/180'},
  {'title': 'Sherlock', 'imageUrl': 'https://picsum.photos/id/77/120/180'},
  {'title': 'Expats', 'imageUrl': 'https://picsum.photos/id/88/120/180'},
];
