import 'package:flutter/material.dart';
import 'package:food_delivery/common/loader.dart';
import 'package:food_delivery/features/admin/services/admin_services.dart';
import 'package:food_delivery/features/admin/screens/add_products.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products = [];
  List<Product>? product = [];
  final AdminService adminServices = AdminService();

  @override
  void initState() {
    super.initState();
    getproduct();
  }

  getproduct() async {
    product = await adminServices.fetchAllProducts(context);
  }

  fetchAllProducts() async {
    product = await adminServices.fetchAllProducts(context);
    products = product;
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    for (int i = 0; i < product!.length; i++) {
      if (products?[i].admin_name != userprovider.user.name) {
        products?.removeAt(i);
      }
    }
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void Navigate_to_addProduct() {
    Navigator.pushNamed(context, AddProducts.route_name);
  }

  @override
  Widget build(BuildContext context) {
    products = product;
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    for (int i = 0; i < product!.length; i++) {
      if (products?[i].admin_name != userprovider.user.name) {
        products?.removeAt(i);
      }
    }
    setState(() {});
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                print(index);
                final productData = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: Image.network(productData.images[0]),
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
                          onPressed: () => deleteProduct(productData, index),
                          icon: const Icon(
                            Icons.delete_outline,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: Navigate_to_addProduct,
              tooltip: 'Add a Product',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
