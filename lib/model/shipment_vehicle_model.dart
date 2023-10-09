class ShipmentVehicleModel {
  final String icon;
  final String title;
  final String subTitle;

  ShipmentVehicleModel(
      {required this.icon, required this.title, required this.subTitle});
  static List<ShipmentVehicleModel> shipmentVehicle = [
    ShipmentVehicleModel(
        icon: "asset/icon/icon_ship.jpeg",
        title: "Ocean freight",
        subTitle: "International"),
    ShipmentVehicleModel(
        icon: "asset/icon/icon_truck.png",
        title: "Cargo freight",
        subTitle: "Reliable"),
    ShipmentVehicleModel(
        icon: "asset/icon/icon_ship.jpeg",
        title: "Air freight",
        subTitle: "International"),
  ];
}
