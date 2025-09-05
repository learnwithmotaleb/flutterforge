class CommunityModel {
  final int id;
  final String? logo;
  final String? name;
  final String? image;
  final String? title;
  final String? description;
  final String? link;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CommunityModel({
    required this.id,
    this.logo,
    this.name,
    this.image,
    this.title,
    this.description,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      logo: json['logo'],
      name: json['name'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
      link: json['link'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo': logo,
      'name': name,
      'image': image,
      'title': title,
      'description': description,
      'link': link,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
