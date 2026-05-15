




class AddproductInput {
  final String? imagePath;
  final String body;
  final String title;
  final String price;

  
  const AddproductInput({required this.body,
   this.imagePath, required this.title, required this.price});
}