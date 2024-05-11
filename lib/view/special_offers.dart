import 'package:flutter/material.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({super.key});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Special Offers",
            style: TextStyle(
                color: Color(0xff000000),
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Color(0xff000000), size: 30),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: [
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '25% \n',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              height: 1),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Today\'s Special! \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    height: 1.9)),
                            TextSpan(
                              text: 'Get discount for every\n',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.75),
                            ),
                            TextSpan(
                              text: 'order. only valid for today',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: .8),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 160,
                          // margin: EdgeInsets.only(right: 10,left: 90),
                          child: Image.asset(
                            "assets/13.png",
                            fit: BoxFit.cover,
                          ))
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '25% \n',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              height: 1),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Today\'s Special! \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    height: 1.9)),
                            TextSpan(
                              text: 'Get discount for every\n',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.75),
                            ),
                            TextSpan(
                              text: 'order. only valid for today',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: .8),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 160,
                          // margin: EdgeInsets.only(right: 10,left: 90),
                          child: Image.network(
                            "https://th.bing.com/th/id/R.d3becdf372885062d43be71559e0580c?rik=rb9eD6YgBtREiw&pid=ImgRaw&r=0",
                            fit: BoxFit.cover,
                          ))
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '35% \n',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              height: 1),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Today\'s Special! \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    height: 1.9)),
                            TextSpan(
                              text: 'Get discount for every\n',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.75),
                            ),
                            TextSpan(
                              text: 'order. only valid for today',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: .8),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 160,
                          // margin: EdgeInsets.only(right: 10,left: 90),
                          child: Image.network(
                            "https://th.bing.com/th/id/R.6fd1149f307dd194c8edb34a254caa6d?rik=tpHzvW1tnX3pFQ&pid=ImgRaw&r=0",
                            fit: BoxFit.cover,
                          ))
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  // clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '45% \n',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              height: 1),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Today\'s Special! \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    height: 1.9)),
                            TextSpan(
                              text: 'Get discount for every\n',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.75),
                            ),
                            TextSpan(
                              text: 'order. only valid for today',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: .8),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 160,

                          // margin: EdgeInsets.only(right: 10,left: 90),
                          child: Image.network(
                            "https://www.pinclipart.com/picdir/big/538-5380014_womens-fashion-accessories-png-clipart-head-accessories-png.png",
                            fit: BoxFit.cover,
                          ))
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '55% \n',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              height: 1),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Today\'s Special! \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    height: 1.9)),
                            TextSpan(
                              text: 'Get discount for every\n',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.75),
                            ),
                            TextSpan(
                              text: 'order. only valid for today',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: .8),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 160,
                          // margin: EdgeInsets.only(right: 10,left: 90),
                          child: Image.network(
                            "https://www.pngarts.com/files/3/Clothing-Download-Transparent-PNG-Image.png",
                            fit: BoxFit.cover,
                          ))
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '65% \n',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              height: 1),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Today\'s Special! \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    height: 1.9)),
                            TextSpan(
                              text: 'Get discount for every\n',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: 1.75),
                            ),
                            TextSpan(
                              text: 'order. only valid for today',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  height: .8),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 160,
                          // margin: EdgeInsets.only(right: 10,left: 90),
                          child: Image.network(
                            "https://lwfiles.mycourse.app/the-digital-fashion-school-public/21077a334246fe53a81d5e1ce46d9a72.png",
                            fit: BoxFit.cover,
                          ))
                    ],
                  )),
            ]),
          ),
        ));
  }
}
