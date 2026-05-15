





class AddproductOutput {
  final String id;
  final String? imageUrl;
  final String body;
  final String title;
  final String price;

  const AddproductOutput({
  required this.body,
  required this.imageUrl,
  required this.id, required this.title, required this.price});
}