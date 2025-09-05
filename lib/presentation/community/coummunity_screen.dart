import 'package:flutter/material.dart';
import 'package:flutterforge/api/app_api.dart';
import 'package:flutterforge/model/community_mode/community_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  late Future<List<CommunityModel>> _communityFuture;
  final String baseUrl = "https://mfashion.shop.devovateit.com/"; // Base URL for images

  @override
  void initState() {
    super.initState();
    _communityFuture = fetchCommunityProducts();
  }

  Future<List<CommunityModel>> fetchCommunityProducts() async {
    final response = await AppApi.getData(
      'https://mfashion.shop.devovateit.com/api/community-products',
    );

    List data = response['data'];
    return data.map((item) => CommunityModel.fromJson(item)).toList();
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: FutureBuilder<List<CommunityModel>>(
        future: _communityFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: product.logo != null
                                ? NetworkImage(baseUrl + product.logo!)
                                : const AssetImage('assets/icon/user.png')
                            as ImageProvider,
                            radius: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              product.name ?? '',
                              style:
                              const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Image
                      if (product.image != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            baseUrl + product.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const SizedBox(height: 10),

                      // Title & Description
                      Text(
                        product.title ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(product.description ?? ''),

                      const SizedBox(height: 10),

                      // Visit Link Button
                      if (product.link != null)
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => _launchURL(product.link!),
                            child: const Text(
                              'Visit Link',
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          ),
                        ),
                    ],
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
