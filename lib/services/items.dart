class GridItem {
  late String imageUrl;
  late String logoUrl;
  late String price;
  late String name;
  bool isFav = false;

  GridItem(
      {required this.imageUrl,
      required this.logoUrl,
      required this.price,
      required this.name});
}
