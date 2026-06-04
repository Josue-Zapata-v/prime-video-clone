import 'package:flutter/material.dart';
import '../../../app/theme/app_theme.dart';
import '../data/home_data.dart';

class ThumbnailCarousel extends StatelessWidget {
  const ThumbnailCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Text(
            'Títulos populares',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: featuredTitles.length,
            itemBuilder: (context, index) {
              final item = featuredTitles[index];
              return _ThumbnailCard(item: item);
            },
          ),
        ),
      ],
    );
  }
}

class _ThumbnailCard extends StatelessWidget {
  final Map<String, String> item;

  const _ThumbnailCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: SizedBox(
        width: 110,
        child: Image.network(
          item['imageUrl']!,
          fit: BoxFit.cover,
          loadingBuilder: (_, child, progress) {
            if (progress == null) return child;
            return Container(
              width: 110,
              color: AppTheme.surface,
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppTheme.primary,
                ),
              ),
            );
          },
          errorBuilder: (_, __, ___) => Container(
            width: 110,
            color: AppTheme.surface,
            child: const Icon(Icons.movie, color: AppTheme.textSecondary),
          ),
        ),
      ),
    );
  }
}
