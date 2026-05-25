




class GetCartOutput {
  final String docId;
  final String itemId;
  final String name;
  final dynamic price;
  final String? image;

  GetCartOutput({
    required this.itemId,
    required this.name,
    required this.price,
    this.image, required this.docId,
  });
}