import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:libease_app/core/theme/app_theme.dart';
import 'package:libease_app/features/books/domain/entities/book.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mockBooks = [
      Book(
        id: '1',
        isbn: '12345',
        title: 'Mastering Flutter',
        author: 'John Doe',
        category: 'Programming',
        stock: 5,
        imageUrl: 'https://picsum.photos/seed/flutter/400/600',
      ),
      Book(
        id: '2',
        isbn: '67890',
        title: 'Clean Architecture',
        author: 'Uncle Bob',
        category: 'Software Engineering',
        stock: 3,
        imageUrl: 'https://picsum.photos/seed/architecture/400/600',
      ),
      Book(
        id: '3',
        isbn: '11223',
        title: 'Go Programming',
        author: 'Jane Smith',
        category: 'Programming',
        stock: 10,
        imageUrl: 'https://picsum.photos/seed/go/400/600',
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: _buildWelcomeSection(),
          ),
          SliverToBoxAdapter(
            child: _buildCategorySection(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _BookCard(book: mockBooks[index % 3])
                      .animate()
                      .fade(duration: 500.ms, delay: (index * 50).ms)
                      .slideY(begin: 0.1, end: 0);
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      expandedHeight: 80,
      title: const Text('LibEase'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, Selamat Pagi!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const Text(
            'Mau baca buku apa hari ini?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = ['Semua', 'Fiksi', 'Sains', 'Sejarah', 'Komputer'];
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Chip(
              label: Text(categories[index]),
              backgroundColor: index == 0 ? AppTheme.primaryColor : Colors.white,
              labelStyle: TextStyle(
                color: index == 0 ? Colors.white : Colors.black87,
              ),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final Book book;

  const _BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: book.imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(color: Colors.white),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.error_outline, color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  book.author ?? 'Unknown',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Stok: ${book.stock}',
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: AppTheme.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
