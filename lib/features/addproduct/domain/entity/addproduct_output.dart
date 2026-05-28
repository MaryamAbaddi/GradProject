class AddproductOutput {
  final String id;
  final String imageUrl;
  final String body;
  final String title;
  final double price;
  final String ownerId;
  final String productType;

  const AddproductOutput({
    required this.body,
    required this.imageUrl,
    required this.id,
    required this.title,
    required this.price,
    required this.ownerId,
    required this.productType,
  });
}