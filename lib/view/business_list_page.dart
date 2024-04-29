import 'package:business/view/business_details_page.dart';
import 'package:business/viewmodel.dart/business_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessListPage extends StatefulWidget {
  const BusinessListPage({super.key});

  @override
  State<BusinessListPage> createState() => _BusinessListPageState();
}

class _BusinessListPageState extends State<BusinessListPage> {
  late BusinessListViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<BusinessListViewModel>(context, listen: false);
    viewModel.fetchBusinesses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Businesses'),
      ),
      body: Consumer(
        builder: (context, BusinessListViewModel viewModel, child) {
          // viewModel.fetchBusinesses();
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BusinessDetailsPage(business: business),
                      ),
                    );
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(business.name),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
