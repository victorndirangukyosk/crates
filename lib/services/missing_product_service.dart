import 'dart:io';

import 'package:dio/dio.dart';
import 'package:executive_app/rest_client/rest_client.dart';

class MissingProductService {
  static RestClient restClient = RestClient();
  static submit(
      {required int order_id,
      required List<Map<String, dynamic>> products,
      required String executive_name,
      required File customer_signature}) async {
    try {
      var response = await restClient.dio!
          .post('https://dev.api.kwikbasket.com/api/remainders',
              data: FormData.fromMap({
                'executive_name': executive_name,
                'order_id': order_id,
                'remainder_products': products,
                'customer_sign': await MultipartFile.fromFile(
                    customer_signature.path,
                    filename: '${DateTime.now().toString()}.png'),
              }));
      return response.data;
    } catch (e) {
      throw (e);
    }
  }
}
