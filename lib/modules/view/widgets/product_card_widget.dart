import 'package:fake_store_api/data/models/product_list_response.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductListResponse product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              child: Center(
                child: Image.network(
                  product.image??"",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Title
            Text(
              product.title??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 5),

            // Price
            Text(
              "₹ ${product.price}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 5),

            // Category
            Text(
              product.category??"",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 5),


          ],
        ),
      ),
    );
  }
}