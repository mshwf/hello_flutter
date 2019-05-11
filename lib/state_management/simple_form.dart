import 'package:flutter/material.dart';
import 'package:hello_flutter/models/product.dart';

class ProductDetailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Products",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold( 
        body: ProductData(
            child: ProductForm(),
            data:  Product(
                name: 'A50',
                code: 50,
                manufacturer: 'Samsung',
                manDate: '2019')),
      ),
    );
  }
}

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  TextEditingController nameController;
  TextEditingController codeController;
  TextEditingController manController;
  TextEditingController manDateController;

  @override
  Widget build(BuildContext context) {
    var productData = ProductData.of(context);
    nameController = TextEditingController(text:productData.name);
    codeController = TextEditingController(text:productData.code.toString());
    manController = TextEditingController(text:productData.manufacturer);
    manDateController = TextEditingController(text:productData.manDate);
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: 'Name'),
          controller: nameController,
        ),
        TextField(
            decoration: InputDecoration(hintText: 'Code'),
            controller: codeController),
        TextField(
            decoration: InputDecoration(hintText: 'Manufacturer'),
            controller: manController),
        TextField(
            decoration: InputDecoration(hintText: 'Man. Date'),
            controller: manDateController),
      ],
    );
  }
}

class ProductData extends InheritedWidget {
  final Product data;
  final Widget child;
  ProductData({this.data, this.child});
  static Product of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ProductData) as ProductData).data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}