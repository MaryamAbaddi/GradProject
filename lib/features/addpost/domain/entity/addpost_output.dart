










class OutputEntity {
  final String id;
  final String? imageUrl;
  final DateTime createdAt;
  final String uid;
  //final int? likescount;
  final String body;
  const OutputEntity({
  required this.uid,
  required this.body,
  required this.imageUrl,
  required this.createdAt,
  //required this.likescount,
  required this.id});
}