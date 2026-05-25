



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/deleteitemfromcart/presentation/cubit/deletefromcart_cubit.dart';
import 'package:makanek/features/getcartitems/presentation/bloc/getcartitems_bloc.dart';
import 'package:makanek/features/getcartitems/presentation/bloc/getcartitems_events.dart';
import 'package:makanek/features/getcartitems/presentation/bloc/getcartitems_state.dart';
import 'package:makanek/features/getcartitems/presentation/widget/getcartitems_layout.dart';

class GetcartitemsPage extends StatelessWidget {
  const GetcartitemsPage({super.key});

  @override 
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
          create: (_) => getIt<GetcartitemsBloc>()
            ..add(GetcartitemsStarted()),
        
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
           leadingWidth: 90,
          titleSpacing: 50,
          leading:  Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.main),
            child: Row(children: [
              Icon(Icons.arrow_back_ios, color: colors.primary),
              AppText(text: 'Back', fontWeight: FontWeight.bold, textColor: colors.primary, textSize: 16),
            ]),
          ),
        ),
        ),
        body:BlocConsumer<GetcartitemsBloc,GetcartitemsState>
        (listener:(context,state){
          if(state is GetcartitemsError)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
          }
        } ,
          builder:(context,state){
            if(state is GetcartitemsLoading)
            {
               return Center(child: CircularProgressIndicator(color: colors.primary),
              );
            }
            if(state is GetcartitemsSuccess)
            {
                return GetcartitemsLayout(items: state.items, delete: getIt<DeletefromcartCubit>());
            }
            return const SizedBox();
          }
          )
          
      ));
  }
}