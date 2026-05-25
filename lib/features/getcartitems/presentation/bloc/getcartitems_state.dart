




import 'package:equatable/equatable.dart';
import 'package:makanek/features/getcartitems/domain/entity/getcartitems_output.dart';

class GetcartitemsState extends Equatable {
  const GetcartitemsState();

  @override
  List<Object?> get props => [];
}

class GetcartitemsInit extends GetcartitemsState{}

class GetcartitemsSuccess extends GetcartitemsState{
  final List<GetCartOutput> items;

  const GetcartitemsSuccess({required this.items});
  @override
  List<Object?> get props => [items];
}

class GetcartitemsLoading extends GetcartitemsState{}

class GetcartitemsError extends GetcartitemsState{
  final String message;

  const GetcartitemsError({required this.message});

  @override
  List<Object?> get props => [message];
}

