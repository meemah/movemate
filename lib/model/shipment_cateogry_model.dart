class ShipmentCategoryModel {
  final int categoryId;
  final String categoryName;

  ShipmentCategoryModel({required this.categoryId, required this.categoryName});

  static List<ShipmentCategoryModel> categories = [
    ShipmentCategoryModel(categoryId: 1, categoryName: "Documents"),
    ShipmentCategoryModel(categoryId: 2, categoryName: "Glass"),
    ShipmentCategoryModel(categoryId: 3, categoryName: "Liquid"),
    ShipmentCategoryModel(categoryId: 4, categoryName: "Food"),
    ShipmentCategoryModel(categoryId: 5, categoryName: "Electronic"),
    ShipmentCategoryModel(categoryId: 6, categoryName: "Products"),
    ShipmentCategoryModel(categoryId: 7, categoryName: "others"),
  ];
}
