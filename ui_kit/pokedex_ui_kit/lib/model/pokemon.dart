class Pokemon {
  int id;
  String name;
  String image;
  int height;
  int weight;
  List<String> types;

  Pokemon(
      {required this.id,
      required this.name,
      required this.image,
      required this.height,
      required this.weight,
      required this.types});
}
