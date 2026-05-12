



import 'package:equatable/equatable.dart';

class EditprofileEvents extends Equatable{

  const EditprofileEvents();
    @override 
  List<Object?> get props => [];
}



class EditProfileiInit extends EditprofileEvents{
  const EditProfileiInit();
}
class EditProfileSubmitted extends EditprofileEvents{
  final String name;
  final String email;
  const  EditProfileSubmitted({required this.name,required this.email});
}

