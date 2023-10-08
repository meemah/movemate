class ShipmentItemModel {
  final String itemName;
  final String itemId;
  final String fromLocation;
  final String toLocation;

  ShipmentItemModel(
      {required this.itemName,
      required this.itemId,
      required this.fromLocation,
      required this.toLocation});
  static List<ShipmentItemModel> shipmentItems = [
    ShipmentItemModel(
        itemName: "Summer linen jacket",
        itemId: "NEJ21089934122231",
        fromLocation: "Barcelona",
        toLocation: "Paris"),
    ShipmentItemModel(
        itemName: "Tapered-fit jeans AW",
        itemId: "NEJ22089934122231",
        fromLocation: "Columbia",
        toLocation: "Paris"),
    ShipmentItemModel(
        itemName: "Macbook pro M2",
        itemId: "NEJ20189934122231",
        fromLocation: "Paris",
        toLocation: "Morocco"),
    ShipmentItemModel(
        itemName: "Office setup dest",
        itemId: "NEJ1089934122231",
        fromLocation: "France",
        toLocation: "German"),
  ];
}
