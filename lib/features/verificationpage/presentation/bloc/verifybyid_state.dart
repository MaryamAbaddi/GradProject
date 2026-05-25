

import 'package:equatable/equatable.dart';

class VerifybyidState extends Equatable {
  const VerifybyidState();
  @override
  List<Object?> get props => [];
}

class VerifybyidInitial extends VerifybyidState {
  const VerifybyidInitial();
}
class VerifybyidLoading extends VerifybyidState {
  const VerifybyidLoading();
}
class VerifybyidSuccess extends VerifybyidState {
  const VerifybyidSuccess();
}

class VerifybyidError extends VerifybyidState {
  final String message;
  const VerifybyidError(this.message);
  @override 
  List<Object?> get props => [message];


}