import 'package:ecommerce_app/src/features/products/presentation/products_list/products_search_state_provider.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Search field used to filter products by name
class ProductsSearchTextField extends StatefulWidget {
  const ProductsSearchTextField({super.key});

  @override
  State<ProductsSearchTextField> createState() =>
      _ProductsSearchTextFieldState();
}

class _ProductsSearchTextFieldState extends State<ProductsSearchTextField> {
  final _controller = TextEditingController();
  final ProductController _productController = Get.put(ProductController());

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // * Set the initial value of the controller
    _productController.searchProducts('');
  }

  @override
  Widget build(BuildContext context) {
    // See this article for more info about how to use [ValueListenableBuilder]
    // with TextField:
    // https://codewithandrea.com/articles/flutter-text-field-form-validation/
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, _) {
        return TextField(
            controller: _controller,
            autofocus: false,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              hintText: 'Search products'.hardcoded,
              icon: const Icon(Icons.search),
              suffixIcon: value.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _controller.clear();
                        _productController.searchProducts('');
                        // ref
                        //     .read(productsSearchQueryStateProvider.notifier)
                        //     .state = '';
                      },
                      icon: const Icon(Icons.clear),
                    )
                  : null,
            ),
            onChanged: (text) {
              _productController.searchProducts(text);
              // ref.read(productsSearchQueryStateProvider.notifier).state = text,
            }
            // ref.read(productsSearchQueryStateProvider.notifier).state = text,
            );
      },
    );
  }
}
