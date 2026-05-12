



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/features/editprofilepage/presentation/bloc/editpage_bloc.dart';
import 'package:makanek/features/editprofilepage/presentation/bloc/editpage_state.dart';
import 'package:makanek/features/editprofilepage/presentation/bloc/editprofile_events.dart';
import 'package:makanek/features/editprofilepage/presentation/widget/editprofile_layout.dart';

class EditprofilePage extends StatelessWidget {

  const EditprofilePage({super.key});

  @override 
  Widget build(BuildContext context)
  {
    return BlocProvider(create: (_) => getIt<EditProfilePageBloc>()..add(const EditProfileiInit()),
      child:BlocConsumer<EditProfilePageBloc,EditProfilePageState>(
        builder: (context, state){
        if(state is EditProfileLoading)
        {
            return Scaffold(
    body: Center(
      child: CircularProgressIndicator(),));
        }
        else if(state is EditProfileLoaded)
        {
          return EditprofileLayout(name: state.name, email: state.email);
        }

          return SizedBox();
        }
        ,listener: (context, state) {
            if(state is EditProfileSuccess)
            {
             Navigator.pushReplacementNamed(context, AppRoutes.main);
            }
        },
        ),        
      );
  }
}