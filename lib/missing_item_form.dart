import 'dart:io';

import 'package:executive_app/cubits/executive_name_cubit.dart';
import 'package:executive_app/services/missing_product_service.dart';
import 'package:executive_app/services/product_service.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MissingItemForm extends StatefulWidget {
  MissingItemForm({Key? key}) : super(key: key);

  @override
  State<MissingItemForm> createState() => _MissingItemFormState();
}

class _MissingItemFormState extends State<MissingItemForm> {
  bool loading = false;

  var productController = TextEditingController();

  var nameController = TextEditingController();

  var orderIdController = TextEditingController();

  var quantityController = TextEditingController();

  var signatureController = SignatureController();

  var _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Material(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          )
        : Material(
            child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text("Missing products form"),
              ),
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text(context.watch<ExecutiveNameCubit>().state),
                        FormBuilderTextField(
                          name: 'name',
                          onChanged: (val) {
                            context.read<ExecutiveNameCubit>().emit(val!);
                          },
                          validator: FormBuilderValidators.compose(
                              [FormBuilderValidators.required(context)]),
                          controller: nameController,
                          decoration:
                              InputDecoration(hintText: "Executive name"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormBuilderTextField(
                          name: 'order_id',
                          validator: FormBuilderValidators.compose(
                              [FormBuilderValidators.required(context)]),
                          keyboardType: TextInputType.number,
                          controller: orderIdController,
                          decoration: InputDecoration(hintText: "Order id"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: FormBuilderTextField(
                                name: 'product',
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(context)]),
                                controller: productController,
                                decoration: InputDecoration(
                                  hintText: 'Product',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: FormBuilderTextField(
                                name: 'quantity',
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(context)]),
                                controller: quantityController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Quantity',
                                ),
                              ),
                            ),
                            CupertinoButton(
                                child: Icon(Icons.add),
                                onPressed: () {
                                  if (_formKey.currentState!
                                      .saveAndValidate()) {
                                    context.read<ProductsCubit>().state.add({
                                      'order_id': orderIdController.text,
                                      'product_id': 1,
                                      'unit_of_measure': 'kgs',
                                      'product_name': productController.text,
                                      'quantity':
                                          int.parse(quantityController.text)
                                    });
                                    setState(() {});
                                    productController.clear();

                                    quantityController.clear();
                                  }
                                })
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Products"),
                        ...List.generate(
                            context.watch<ProductsCubit>().state.length,
                            (index) => Row(
                                  children: [
                                    Text(context
                                        .read<ProductsCubit>()
                                        .state[index]['product_name']),
                                    Expanded(child: Container()),
                                    CupertinoButton(
                                        child: Icon(Icons.close),
                                        onPressed: () {
                                          context
                                              .read<ProductsCubit>()
                                              .state
                                              .removeAt(index);
                                        })
                                  ],
                                )),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Customer Signature"),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          width: 300,
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          child: Signature(
                            controller: signatureController,
                            height: 200,
                            width: 300,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoButton(
                            child: Text("Submit"),
                            color: Colors.blue,
                            onPressed: () async {
                              // if (_formKey.currentState!.saveAndValidate()) {
                              setState(() {
                                loading = true;
                              });
                              var image =
                                  await signatureController.toPngBytes();
                              final tempDir = await getTemporaryDirectory();
                              File file =
                                  await File('${tempDir.path}/image.png')
                                      .create();
                              file.writeAsBytesSync(image!);

                              await MissingProductService.submit(
                                  order_id: int.parse(orderIdController.text),
                                  executive_name:
                                      context.read<ExecutiveNameCubit>().state,
                                  products: context.read<ProductsCubit>().state,
                                  customer_signature: file);
                              context.read<ProductsCubit>().state.clear();
                              signatureController.clear();
                              setState(() {
                                loading = false;
                              });
                              // }
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

class ProductsCubit extends Cubit<List<Map<String, dynamic>>> {
  ProductsCubit(List<Map<String, dynamic>> initialState) : super(initialState);
}
