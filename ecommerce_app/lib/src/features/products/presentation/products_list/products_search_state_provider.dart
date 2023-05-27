import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:get/get.dart';
// import 'package:your_app/models/product.dart';
// import 'package:your_app/repository/repository.dart';

class ProductController extends GetxController {
  final FakeProductsRepository _repository = FakeProductsRepository.instance;

  RxList<Product> products = RxList<Product>([]);
  RxString searchQuery = ''.obs;

  void searchProducts(String query) {
    print(query);
    searchQuery.value = query;
    products.value = _repository.searchProducts(searchTerm: query);
  }
}
