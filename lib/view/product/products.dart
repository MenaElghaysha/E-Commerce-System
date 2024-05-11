import 'package:e_commerce/provider/selectedindex.dart';
import 'package:e_commerce/view/cart_screen.dart';
import 'package:e_commerce/view/product/product_details.dart';
import 'package:e_commerce/view/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../API/APIforAllProducts.dart';
import '../../model/products.dart';

// ignore: must_be_immutable
class Products extends StatelessWidget {
  const Products({super.key});
  String getCategoryBasedOnIndex(int index) {
    switch (index) {
      case 0:
        return "https://fakestoreapi.com/products";
      case 1:
        return "https://fakestoreapi.com/products/category/men's%20clothing";
      case 2:
        return "https://fakestoreapi.com/products/category/women's%20clothing";
      case 3:
        return "https://fakestoreapi.com/products/category/jewelery";
      case 4:
        return "https://fakestoreapi.com/products/category/electronics";
      default:
        return "https://fakestoreapi.com/products";
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ProductsResponse> products = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Our Products",
          style: TextStyle(color: Color(0xff000000), fontSize: 26),
        ),
        iconTheme: const IconThemeData(color: Color(0xff000000), size: 28),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => showSearch(
                  context: context, delegate: DataSearch(products: products)),
              icon: const Icon(Icons.search)),

          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: const Icon(Icons.shopping_cart))

          /////////////////////////
        ],
      ),
      body: FutureBuilder<List<ProductsResponse>>(
        future: ProductsAPI().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // set data into products list to use it in search
            products = snapshot.data!;

            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                ProductsResponse iteam = snapshot.data![index];
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => productDetails(iteam: iteam),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 6, child: Image.network(iteam.image)),
                        Expanded(
                            flex: 1,
                            child: Text(iteam.title,
                                style: const TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis)),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              const Expanded(flex: 1, child: SizedBox()),
                              Icon(
                                Icons.star_half,
                                size: 25,
                                color: Colors.yellow[700],
                              ),
                              Text(
                                iteam.rating.rate.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Expanded(flex: 4, child: SizedBox()),
                              Text(
                                "${iteam.price}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Icon(
                                Icons.attach_money,
                                color: Colors.green[400],
                                size: 22,
                              ),
                              const Expanded(flex: 1, child: SizedBox()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          if (snapshot.hasError) {
            print('Error in shapshot Data : ${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
