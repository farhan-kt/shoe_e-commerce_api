import 'package:flutter/material.dart';
import 'package:shoe_e_commerce/view/cart_screen.dart';
import 'package:shoe_e_commerce/widget/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search...',
                        labelStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        suffixIcon: const Icon(Icons.search)),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                      color: const Color(0xFF202020),
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6), blurRadius: 5)
                      ]),
                  padding: const EdgeInsets.all(4),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen()));
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                )
              ],
            ),
            const SizedBox(height: 20),
            textAmaranth(data: "HOME", size: 30, weight: FontWeight.w800),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Placeholder(
                          fallbackHeight: mediaQuery.height * 0.28,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "NIKE",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "₹ 1000",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
