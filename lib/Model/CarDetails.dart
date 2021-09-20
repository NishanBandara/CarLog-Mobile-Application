class CarDetails {
  CarDetails({this.carBrand, this.carPrice, this.horsePower});

  String carBrand;
  double carPrice;
  double horsePower;

  factory CarDetails.fromJson(Map<String, dynamic> json) => CarDetails(
        carBrand: json["name"],
        horsePower: json["avg_horsepower"].toDouble(),
        carPrice: json["avg_price"].toDouble(),
      );
}
