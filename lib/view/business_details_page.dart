import 'package:business/model/business.dart';
import 'package:flutter/material.dart';

class BusinessDetailsPage extends StatelessWidget {
  final Business business;

  const BusinessDetailsPage({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(business.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (business.imageUrl != null)
              Image.network(
                business.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16),
            Text('Rating: ${business.rating}'),
            const SizedBox(height: 8),
            Text(
                'Categories: ${business.categories.map((category) => category.title).join(', ')}'),
            const SizedBox(height: 8),
            Text('Address: ${business.location.displayAddress.join(', ')}'),
            const SizedBox(height: 8),
            if (business.phone != null) Text('Phone: ${business.phone}'),
            const SizedBox(height: 8),
            Text('Review Count: ${business.reviewCount}'),
            const SizedBox(height: 8),
            Text('Transactions: ${business.transactions.join(', ')}'),
            const SizedBox(height: 8),
            Text('Price: ${business.price}'),
            const SizedBox(height: 8),
            if (business.phone != null) Text('Phone: ${business.phone}'),
            const SizedBox(height: 8),
            Text('Display Phone: ${business.displayPhone}'),
            const SizedBox(height: 8),
            Text('Distance: ${business.distance.toStringAsFixed(2)} meters'),
          ],
        ),
      ),
    );
  }
}
