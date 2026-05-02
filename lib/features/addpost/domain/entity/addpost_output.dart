








/*class OutputEntity {
  final int id;
  final String title; 
  final String body;
  const OutputEntity({required this.body,
  required this.title,
  required this.id});
}*/

class OutputEntity {
  final String id;
  final String? imageUrl;
  final DateTime createdAt;
  //final int? likescount;
  final String body;
  const OutputEntity({required this.body,
  required this.imageUrl,
  required this.createdAt,
  //required this.likescount,
  required this.id});
}