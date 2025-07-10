// lib/data/models/location_model.dart
class LocationModel {
  final double latitude;
  final double longitude;
  final String? address;
  final String? name;
  final DateTime? timestamp;

  LocationModel({
    required this.latitude,
    required this.longitude,
    this.address,
    this.name,
    this.timestamp,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
      address: json['address'],
      name: json['name'],
      timestamp: json['timestamp'] != null 
          ? DateTime.parse(json['timestamp'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'name': name,
      'timestamp': timestamp?.toIso8601String(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'name': name,
      'timestamp': timestamp?.millisecondsSinceEpoch,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      address: map['address'],
      name: map['name'],
      timestamp: map['timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['timestamp'])
          : null,
    );
  }
}

// lib/data/models/travel_destination_model.dart
class TravelDestinationModel {
  final int? id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String? imageUrl;
  final String? category;
  final double? rating;
  final String? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TravelDestinationModel({
    this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    this.imageUrl,
    this.category,
    this.rating,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory TravelDestinationModel.fromJson(Map<String, dynamic> json) {
    return TravelDestinationModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
      imageUrl: json['image_url'],
      category: json['category'],
      rating: json['rating']?.toDouble(),
      address: json['address'],
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
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'image_url': imageUrl,
      'category': category,
      'rating': rating,
      'address': address,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'image_url': imageUrl,
      'category': category,
      'rating': rating,
      'address': address,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory TravelDestinationModel.fromMap(Map<String, dynamic> map) {
    return TravelDestinationModel(
      id: map['id'],
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      imageUrl: map['image_url'],
      category: map['category'],
      rating: map['rating']?.toDouble(),
      address: map['address'],
      createdAt: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
    );
  }

  TravelDestinationModel copyWith({
    int? id,
    String? name,
    String? description,
    double? latitude,
    double? longitude,
    String? imageUrl,
    String? category,
    double? rating,
    String? address,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TravelDestinationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}