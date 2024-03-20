import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String? name;
  final String? image;
  bool isAdded;

  ProductModel({
    this.name,
    this.image,
    this.isAdded = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      image: json['image'],
      isAdded: json['isAdded'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['isAdded'] = isAdded;
    return data;
  }

  @override
  List<Object?> get props => [
        name,
        image,
        isAdded,
      ];
}
