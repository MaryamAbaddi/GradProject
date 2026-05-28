


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/main_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getpurchases/presentation/bloc/getpurchases_bloc.dart';
import 'package:makanek/features/getpurchases/presentation/bloc/getpurchases_events.dart';
import 'package:makanek/features/getpurchases/presentation/bloc/getpurchases_state.dart';
import 'package:makanek/features/getpurchases/presentation/widget/getpurchases_layout.dart';

class GetpurchasesPage extends StatelessWidget {
  const GetpurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(create: (_) => getIt<GetpurchasesBloc>()..add(PurchaseSubmitted()),
    child:Scaffold(
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
        body:BlocConsumer<GetpurchasesBloc,GetpurchasesState>
        (listener: (context,state){
          if(state is GetPurchasesError)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
              if(state is GetPurchasesLoad)
            {
               return Center(child: CircularProgressIndicator(color: colors.primary),
              );
            }
            if(state is GetPurchasesSucces)
            {
              return GetpurchasesLayout(purchases: state.purchases,);
            }
            return const SizedBox(); 
          },
        ),
    )

    );
  }

  
}