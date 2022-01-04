import 'package:executive_app/models/product.dart';
import 'package:executive_app/rest_client/rest_client.dart';

class ProductService {
  static RestClient? restClient;

  Future<List<Product>?> searchProducts({required String name}) async {
    try {
      var x = await restClient!.dio!.get(
          '${restClient!.baseURL}/api/customer/products/productsearch',
          queryParameters: {'name': name});

      List y = x.data['data']['products'];
      return List<Product>.generate(
          y.length, (index) => Product.fromJson(y[index]));
    } catch (e) {
      throw e;
    }
  }
}
