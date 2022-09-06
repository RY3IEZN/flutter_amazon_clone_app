import 'package:flutter/material.dart';
import 'package:flutter_amazonclone/model/product_model.dart';
import 'package:flutter_amazonclone/services/admin_service.dart';
import 'package:flutter_amazonclone/widgets/add_products_screen.dart';
import 'package:flutter_amazonclone/widgets/loader.dart';
import 'package:flutter_amazonclone/widgets/single_product.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminServices adminServices = AdminServices();
  List<Product>? products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProduct(context);
    setState(() {});
    print(products);
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: products!.length,
              itemBuilder: (BuildContext context, int index) {
                final productData = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(image: productData.images[0]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                            onPressed: () =>
                                {deleteProduct(productData, index)},
                            icon: Icon(Icons.delete_forever_outlined))
                      ],
                    )
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProductsScreen.routeName);
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.teal,
              tooltip: "Add Products",
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat);
  }
}
