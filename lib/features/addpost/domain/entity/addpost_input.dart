


/*class InputEntity {
  final String title; 
  final String body;
  const InputEntity({required this.body,
  required this.title});
}*/


class InputEntity {
  final String? imagePath;
  final String body;
  const InputEntity({required this.body,
   this.imagePath});
}