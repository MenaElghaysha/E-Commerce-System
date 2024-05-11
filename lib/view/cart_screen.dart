import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/model/ratingmap.dart';
import 'package:e_commerce/provider/purchases.dart';
import 'package:e_commerce/sql/SQLP.dart';
import 'package:e_commerce/sql/sqlModels/sql_productsModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.notes,
              color: Colors.black,
              size: 40,
            ),
          ),
          title: const Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Text(
              'My Cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: const [
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: const CartList());
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List<SQLProduct> productsToBuy = [];
  double calculateTotalPrice() {
    double total = 0;
    for (var product in productsToBuy) {
      total += product.price * Provider.of<Purchasses>(context).num;
    }
    return total;
  }

  String calculateProductTotalPrice(int index) {
    double totalPrice =
        productsToBuy[index].price * Provider.of<Purchasses>(context).num;
    return totalPrice.toStringAsFixed(2); // Adjust the formatting as needed
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      FutureBuilder<List<SQLProduct>>(
          future: ProductsData.instance.getAllProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<SQLProduct>> snapshot) {
            if (snapshot.hasData) {
              productsToBuy = snapshot.data!;
              return ListView.builder(
                  itemCount: productsToBuy.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: Card(
                        surfaceTintColor:
                            const Color.fromARGB(255, 166, 166, 166),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 10, 10, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 100,
                                width: 100,
                                child: Image.network(
                                    productsToBuy.elementAt(i).image),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.00, 0.00),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 195,
                                          child: Text(
                                            productsToBuy.elementAt(i).title,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              await showModalBottomSheet(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(15.0),
                                                    ),
                                                  ),
                                                  context: context,
                                                  builder: (context) {
                                                    return SizedBox(
                                                        height: 330,
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Column(
                                                              children: [
                                                                const Text(
                                                                  "Remove from cart?",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          26),
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                const Divider(
                                                                  thickness: 1,
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  elevation: 4,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Container(
                                                                          //margin: const EdgeInsets.only(right: 10),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                          ),
                                                                          height:
                                                                              100,
                                                                          width:
                                                                              100,
                                                                          child: Image.network(productsToBuy
                                                                              .elementAt(i)
                                                                              .image),
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.00,
                                                                              0.00),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: 195,
                                                                                    child: Text(
                                                                                      productsToBuy.elementAt(i).title,
                                                                                      style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 18, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Align(
                                                                                alignment: const AlignmentDirectional(-1.00, 0.00),
                                                                                child: Row(mainAxisSize: MainAxisSize.max, children: [
                                                                                  Container(
                                                                                    // if(productsToBuy.elementAt(i).category == "men's clothing"){}
                                                                                    width: 15,
                                                                                    height: 15,
                                                                                    decoration: BoxDecoration(
                                                                                      color: productsToBuy.elementAt(i).category == "men's clothing"
                                                                                          ? Colors.black
                                                                                          : productsToBuy.elementAt(i).category == "jewelery"
                                                                                              ? Colors.blue
                                                                                              : productsToBuy.elementAt(i).category == "electronics"
                                                                                                  ? Colors.yellow
                                                                                                  : Colors.red,
                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 5,
                                                                                  ),
                                                                                  Text(
                                                                                    productsToBuy.elementAt(i).category,
                                                                                  ),
                                                                                ]),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Row(
                                                                                // mainAxisSize: MainAxisSize.max,
                                                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Text(
                                                                                    "${productsToBuy.elementAt(i).price * Provider.of<Purchasses>(context).num}",
                                                                                    style: const TextStyle(
                                                                                      fontSize: 20,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                  ),
                                                                                  const Icon(
                                                                                    Icons.attach_money,
                                                                                    color: Colors.black,
                                                                                    size: 22,
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 50,
                                                                                  ),
                                                                                  Container(
                                                                                    width: 100,
                                                                                    height: 40,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                const Divider(
                                                                  thickness: 1,
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    ElevatedButton(
                                                                        style: ButtonStyle(
                                                                            minimumSize: const MaterialStatePropertyAll(Size(180,
                                                                                50)),
                                                                            backgroundColor: const MaterialStatePropertyAll(Color(
                                                                                0xFFDCDCDC)),
                                                                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(
                                                                                    20)))),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "Cancel",
                                                                          style: TextStyle(
                                                                              fontSize: 23,
                                                                              color: Colors.black),
                                                                        )),
                                                                    ElevatedButton(
                                                                        style: ButtonStyle(
                                                                            minimumSize: const MaterialStatePropertyAll(Size(180,
                                                                                50)),
                                                                            backgroundColor: const MaterialStatePropertyAll(Colors
                                                                                .black),
                                                                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(
                                                                                    20)))),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {});
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(const SnackBar(content: Text('Item deleted Successfully')));
                                                                          Navigator.pop(
                                                                              context);
                                                                          ProductsData
                                                                              .instance
                                                                              .delete(productsToBuy.elementAt(i).id);
                                                                          productsToBuy
                                                                              .removeAt(i);
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "Yes, Remove",
                                                                          style: TextStyle(
                                                                              fontSize: 23,
                                                                              color: Colors.white),
                                                                        )),
                                                                  ],
                                                                )
                                                              ],
                                                            )));
                                                  });
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline_rounded,
                                              size: 30,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(
                                          -1.00, 0.00),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              // if(productsToBuy.elementAt(i).category == "men's clothing"){}
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                color: productsToBuy
                                                            .elementAt(i)
                                                            .category ==
                                                        "men's clothing"
                                                    ? Colors.black
                                                    : productsToBuy
                                                                .elementAt(i)
                                                                .category ==
                                                            "jewelery"
                                                        ? Colors.blue
                                                        : productsToBuy
                                                                    .elementAt(
                                                                        i)
                                                                    .category ==
                                                                "electronics"
                                                            ? Colors.yellow
                                                            : Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              productsToBuy
                                                  .elementAt(i)
                                                  .category,
                                            ),
                                          ]),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "\$${productsToBuy.elementAt(i).price * Provider.of<Purchasses>(context).num}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFDCDCDC),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5, 5, 5, 5),
                                            child: Row(
                                              //   mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Provider.of<Purchasses>(
                                                            context,
                                                            listen: false)
                                                        .decrement();
                                                  },
                                                  child: const Icon(
                                                    Icons.remove_rounded,
                                                    color: Colors.black,
                                                    size: 24,
                                                  ),
                                                ),
                                                Text(
                                                  "${Provider.of<Purchasses>(context).num}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Provider.of<Purchasses>(
                                                            context,
                                                            listen: false)
                                                        .increment();
                                                  },
                                                  child: const Icon(
                                                    Icons.add_rounded,
                                                    color: Colors.black,
                                                    size: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            }
            if (productsToBuy == []) {
              Center(
                child: SizedBox(
                  height: 600,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/no items.png"),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "NO ITEMS",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: SizedBox(
                height: 600,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/no items.png"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "NO ITEMS",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            );
          }),
      Align(
        alignment: const AlignmentDirectional(0.00, 1.00),
        child: Container(
          width: 404,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                        color: Color(0xFF636363),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$${calculateTotalPrice()}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(200, 47)),
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  child: const Text(
                    "Check Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
