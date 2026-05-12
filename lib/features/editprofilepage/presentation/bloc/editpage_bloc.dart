import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/editprofilepage/domain/usecase/editprofile_usecase.dart';
import 'package:makanek/features/editprofilepage/domain/entity/editprofile_input.dart';
import 'package:makanek/features/editprofilepage/presentation/bloc/editpage_state.dart';
import 'package:makanek/features/editprofilepage/presentation/bloc/editprofile_events.dart';

class EditProfilePageBloc extends Bloc<EditprofileEvents, EditProfilePageState> {
  final EditprofileUsecase usecase;
  final GetProfileUsecase usecaseGet;
  EditProfilePageBloc({required this.usecase,required this.usecaseGet}) : super(const EditProfilePageState()) {
    on<EditProfileiInit>((event,emit) async{
      emit(const EditProfileLoading());
    try{
      final result= await usecaseGet();
      emit(EditProfileLoaded(email:result.email, name: result.name));
    }
    catch (e){
      emit(EditProfileError(message:'An error occured!'));
      
    }});
    on<EditProfileSubmitted>((event, emit) async {
      emit(const EditProfileLoading());
      try {
        await usecase(EditprofileInput(name: event.name,email: event.email));
        emit(const EditProfileSuccess());
      } catch (e) {
        emit(EditProfileError(message: e.toString()));
      }
    });
  }
}