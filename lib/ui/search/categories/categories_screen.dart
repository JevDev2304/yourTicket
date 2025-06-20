import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets_app/ui/search/providers/search_controller_provider.dart';
import 'package:tickets_app/ui/widgets/empty_state.dart';
import 'package:tickets_app/ui/widgets/error_state.dart';
import 'package:tickets_app/ui/widgets/loading.dart';

class CategoriesScreen extends ConsumerWidget {
  // final List<Category> categories = [
  //   Category(
  //     name: 'Concerts',
  //     imageUrl:
  //         'https://s3.amazonaws.com/rtvc-assets-senalcolombia.gov.co/s3fs-public/field/image/listado-conciertos-2025-colombia-portada.jpg',
  //   ),
  //   Category(
  //     name: 'Sports',
  //     imageUrl:
  //         'https://www.kantar.com/-/media/project/kantar/global/articles/images/2024/brands-sports-ads_1500x1000jpeg.jpeg',
  //   ),
  //   Category(
  //     name: 'Theater',
  //     imageUrl:
  //         'https://thehanovertheatre.org/wp-content/uploads/2025/03/SIX_1920-x-1080-hero-image-DCM-video-card-FB-event.jpg',
  //   ),
  //   Category(
  //     name: 'Festivals',
  //     imageUrl:
  //         'https://turismo.encolombia.com/wp-content/uploads/2012/12/Carnaval-de-Barranquilla-Festival.png',
  //   ),
  //   Category(
  //     name: 'Conferences',
  //     imageUrl:
  //         'https://weezevent.com/wp-content/uploads/2023/01/12154730/animer-conferences-captivantes.jpg',
  //   ),
  //   Category(
  //     name: 'Children',
  //     imageUrl:
  //         'https://people.com/thmb/FC73Kvzc4bfo6ByvBxXobw9s8Zs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(749x699:751x701)/Blueys-Big-Play-cf6f15135fbd421a899d74abc4285791.jpg',
  //   ),
  // ];

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoryControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: const Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey.shade300),
        ),
      ),
      backgroundColor: Colors.white,
      body:
          categoriesState.isLoading
              ? Loading()
              : categoriesState.errorMessage != null
              ? ErrorState(categoriesState.errorMessage!)
              : categoriesState.listOfCategories.isEmpty
              ? EmptyState()
              : GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1.4,
                ),
                itemCount: categoriesState.listOfCategories.length,
                itemBuilder: (context, index) {
                  final category = categoriesState.listOfCategories[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      context.push('/search_by_category?q=${category.name}');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Imagen
                          Image.network(
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
                          // Gradiente y texto
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              category.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4,
                                    color: Colors.black45,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
