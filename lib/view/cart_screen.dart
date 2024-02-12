import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: 15,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        height: mediaQuery.width * .25,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: mediaQuery.width * .2,
                                    width: mediaQuery.width * .2,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/dummy.jpg'),
                                            fit: BoxFit.cover),
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * .02,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '   Prodect Name',
                                        style: TextStyle(
                                            fontSize: mediaQuery.width * 0.035,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '   ₹ 1999',
                                        style: TextStyle(
                                            fontSize: mediaQuery.width * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // IconButton(
                                          //   onPressed: () {},
                                          //   icon: Icon(
                                          //     EneftyIcons.add_square_outline,
                                          //     size: mediaQuery.width * 0.07,
                                          //   ),
                                          // ),
                                          Text(
                                            "05",
                                            style: TextStyle(
                                                fontSize:
                                                    mediaQuery.width * 0.04,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.abc,
                                                size: mediaQuery.width * 0.07),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.closed_caption_rounded,
                                      size: mediaQuery.width * 0.07))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Positioned(
                bottom: 0,
                left: 5,
                right: 5,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(
                                fontSize: mediaQuery.width * 0.05,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "₹15253.00",
                            style: TextStyle(
                                fontSize: mediaQuery.width * 0.05,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ds'))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
