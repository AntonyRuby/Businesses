import 'package:business/view/business_details_page.dart';
import 'package:business/viewmodel.dart/business_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessListPage extends StatelessWidget {
  const BusinessListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Businesses'),
      ),
      body: Consumer(
        builder: (context, BusinessListViewModel viewModel, child) {
          viewModel.fetchBusinesses();
          if (viewModel.isLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading Businesses...'),
                ],
              ),
            );
          } else if (viewModel.error.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Error: ${viewModel.error}'),
              ),
            );
          } else if (viewModel.businesses.isEmpty) {
            return const Center(
              child: Text('No businesses found'),
            );
          } else {
            return ListView.builder(
              itemCount: viewModel.businesses.length,
              itemBuilder: (context, index) {
                final business = viewModel.businesses[index];
                return ListTile(
                  title: Text(business.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BusinessDetailsPage(business: business),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
