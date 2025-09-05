// api_url.dart

class ApiUrl {
  // Base URL
  static const String baseUrl = "https://mfashion.shop.devovateit.com/api";

  // Community Products
  static const String communityProducts = "$baseUrl/community-products";

  // Example: if you want to get product by ID
  static String communityProductById(int id) => "$baseUrl/community-products/$id";
}
