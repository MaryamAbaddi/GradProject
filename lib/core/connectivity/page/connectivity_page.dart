


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:makanek/core/connectivity/cubit/connectivity_state.dart';

class ConnectivityPage extends StatelessWidget {
  final Widget child;
  const ConnectivityPage({super.key, required this.child});

  @override 
  Widget build(BuildContext context)
  {
    return BlocListener<ConnectivityCubit,ConnectivityState>(
      listener:(context,state){
        if(state is ConnectivityDisconnected){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No internet connection"),backgroundColor: Colors.red,));
        }
    else {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      },
      child:child
    );
  }

}