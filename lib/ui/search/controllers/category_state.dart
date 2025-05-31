import 'package:tickets_app/domain/model/category.dart';

class CategoryState {
  final List<Category> listOfCategories;
  final bool isLoading;
  final String? errorMessage;

  CategoryState({
    this.listOfCategories = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  CategoryState copyWith({
    List<Category>? listOfCategories,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CategoryState(
      listOfCategories: listOfCategories ?? this.listOfCategories,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
