

import 'package:equatable/equatable.dart';

class EditProfilePageState extends Equatable {
  const EditProfilePageState();
  @override 
  List<Object?> get props => [];
}

class EditProfileSuccess extends EditProfilePageState{
  const EditProfileSuccess();
}

class EditProfileLoaded extends EditProfilePageState{
  final String name;
  final String email;
  const EditProfileLoaded({required this.email,required this.name});
}

class EditProfileLoading extends EditProfilePageState{
  const EditProfileLoading();
}


class EditProfileError extends EditProfilePageState{
  final String message;
  const EditProfileError({required this.message});
  @override 
  List<Object?> get props => [message];
}