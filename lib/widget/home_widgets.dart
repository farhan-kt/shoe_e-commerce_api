import 'package:flutter/material.dart';

Widget searchTextFormField({onChanged, controller}) {
  return Expanded(
    child: TextFormField(
      onChanged: onChanged,
      controller: controller,
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
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: const Icon(Icons.search),
      ),
    ),
  );
}

Widget cartIconContainer({Function()? onPressed}) {
  return Container(
    height: 46,
    width: 46,
    decoration: const BoxDecoration(
      color: Color(0xFF202020),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 5),
      ],
    ),
    padding: const EdgeInsets.all(4),
    child: IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.shopping_cart_outlined),
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount gridDelegate(childAspectRatio) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: childAspectRatio,
  );
}

Widget gridViewHome(BuildContext context) {
  Size mediaQuery = MediaQuery.of(context).size;
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      crossAxisSpacing: mediaQuery.width * .05,
      mainAxisSpacing: mediaQuery.height * .06,
    ),
    itemCount: 10,
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
              child: Image.asset('assets/shoe.jpg'),
            ),
            const SizedBox(height: 10),
            const Text(
              'title',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'desc',
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
                  'price',
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
                  ),
                )
              ],
            ),
          ],
        ),
      );
    },
  );
}
