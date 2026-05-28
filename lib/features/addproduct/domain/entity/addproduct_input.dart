




class AddproductInput {
  final String imagePath;
  final String body;
  final String title;
  final double price;
    final String productType;


  
  const AddproductInput({required this.body,
   required this.imagePath, required this.title, required this.price, required this.productType});
}