import 'package:flutter/material.dart';
import 'package:tickets_app/ui/categories/widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(
      name: 'Concerts',
      imageUrl:
          'https://s3.amazonaws.com/rtvc-assets-senalcolombia.gov.co/s3fs-public/field/image/listado-conciertos-2025-colombia-portada.jpg',
    ),
    Category(
      name: 'Sports',
      imageUrl:
          'https://www.kantar.com/-/media/project/kantar/global/articles/images/2024/brands-sports-ads_1500x1000jpeg.jpeg',
    ),
    Category(
      name: 'Theater',
      imageUrl:
          'https://thehanovertheatre.org/wp-content/uploads/2025/03/SIX_1920-x-1080-hero-image-DCM-video-card-FB-event.jpg',
    ),
    Category(
      name: 'Festivals',
      imageUrl:
          'https://turismo.encolombia.com/wp-content/uploads/2012/12/Carnaval-de-Barranquilla-Festival.png',
    ),
    Category(
      name: 'Conferences',
      imageUrl:
          'https://weezevent.com/wp-content/uploads/2023/01/12154730/animer-conferences-captivantes.jpg',
    ),
    Category(
      name: 'Children',
      imageUrl:
          'https://people.com/thmb/FC73Kvzc4bfo6ByvBxXobw9s8Zs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(749x699:751x701)/Blueys-Big-Play-cf6f15135fbd421a899d74abc4285791.jpg',
    ),
  ];

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.5,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    category.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: const Center(
                          child: Icon(Icons.image_not_supported),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
