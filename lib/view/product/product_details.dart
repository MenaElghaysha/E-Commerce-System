import 'package:e_commerce/provider/purchases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/products.dart';
import '../../sql/SQLP.dart';
import '../../sql/sqlModels/sql_productsModel.dart';

class productDetails extends StatelessWidget {
  final ProductsResponse iteam;

  const productDetails({super.key, required this.iteam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(alignment: Alignment.bottomCenter, children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                  height: 400,
                  child: Image.network(
                    iteam.image,
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  // margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  decoration: const BoxDecoration(
                      color: Color(0xffF0F3F5),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      Text(
                        iteam.title,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff191919)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: Row(children: [
                          Card(
                            elevation: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 4),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color(0xffF0F3F5)),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: iteam.rating.count.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Reviewers',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[700])),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.yellow[700],
                          ),
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.yellow[700],
                          ),
                          Icon(
                            Icons.star_half,
                            size: 30,
                            color: Colors.yellow[700],
                          ),
                          Icon(
                            Icons.star_outline,
                            size: 30,
                            color: Colors.yellow[700],
                          ),
                          Icon(
                            Icons.star_outline,
                            size: 30,
                            color: Colors.yellow[700],
                          ),
                          Text(
                            " ${iteam.rating.rate}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xff2B303A),
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'About',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 240,
                              ),
                              Favorite()
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        iteam.description,
                        style: const TextStyle(
                            color: Color(0xff1E2021),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const AlignmentDirectional(0.00, 1.00),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
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
                          "\$ ${iteam.price}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Added Successfully')));

                        // Use the updated Purchasses provider to handle quantities
                        // Provider.of<Purchasses>(context, listen: false)
                        //     .buy(iteam);

                        // Update the ProductsData to use the updated quantity
                        ProductsData.instance.insert(SQLProduct(
                          id: iteam.id,
                          title: iteam.title,
                          image: iteam.image,
                          price: iteam.price,
                          category: iteam.category,
                        ));
                      },
                      style: const ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(200, 47)),
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      child: const Text(
                        "Add to cart",
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
        ]));
  }
}

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool _selectOn = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        size: 35,
        color: _selectOn ? Colors.red : Colors.black,
      ),
      onPressed: () {
        setState(() {
          _selectOn = !_selectOn;
        });
      },
    );
  }
}
