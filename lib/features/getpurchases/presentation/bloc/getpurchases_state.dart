



import 'package:equatable/equatable.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';

class GetpurchasesState extends Equatable {
  const GetpurchasesState();
  @override
  List<Object?> get props => [];
}

class GetPurchasesinit extends GetpurchasesState {}
class GetPurchasesLoad extends GetpurchasesState {}
class GetPurchasesError extends GetpurchasesState {
  final String message;

  const GetPurchasesError({required this.message});
  
  @override 
  List<Object?> get props => [message];
}
class GetPurchasesSucces extends GetpurchasesState {
  final List<Addpurchasesoutput> purchases;

  const GetPurchasesSucces({required this.purchases});
  @override 
  List<Object?> get props => [purchases];
 
}

