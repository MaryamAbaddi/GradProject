import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/addpurchases/presentation/cubit/addpurchases_cubit.dart';
import 'package:makanek/features/deleteitemfromcart/presentation/cubit/deletefromcart_cubit.dart';
import 'package:makanek/features/getcartitems/domain/entity/getcartitems_output.dart';
import 'package:makanek/features/getcartitems/presentation/bloc/getcartitems_bloc.dart';
import 'package:makanek/features/getcartitems/presentation/bloc/getcartitems_events.dart';
import 'package:makanek/features/getcartitems/presentation/widget/getcartitems_cart.dart';
import 'package:makanek/features/getcartitems/presentation/widget/paymentmethodsheet_widget.dart';

class GetcartitemsLayout extends StatefulWidget {
  final List<GetCartOutput> items;
  final DeletefromcartCubit delete;

  const GetcartitemsLayout({super.key, required this.items, required this.delete});

  @override
  State<GetcartitemsLayout> createState() => _GetcartitemsLayoutState();
}

class _GetcartitemsLayoutState extends State<GetcartitemsLayout> {
  final Map<String, int> quantities = {};
  String _selectedMethod = 'cash';

  int getCount(String itemId) => quantities[itemId] ?? 1;

  double get total {
    return widget.items.fold(0.0, (sum, item) {
      final count = getCount(item.itemId);
      return sum + (double.parse(item.price.toString()) * count);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppTitle(
                size: 35,
                title: 'Cart',
                weight: FontWeight.bold,
                titleColor: colors.primary,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey[300]!, width: 0.75),
              ),
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetcartitemsBloc>().add(GetcartitemsStarted());
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 16),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return GetcartitemsCard(
                    item: item,
                    count: getCount(item.itemId),
                    onIncrement: () {
                      setState(() {
                        quantities[item.itemId] = getCount(item.itemId) + 1;
                      });
                    },
                    onDecrement: () {
                        if (getCount(item.itemId) == 1) {
                          widget.delete.deleteFromCart(item.docId);
                          context.read<GetcartitemsBloc>().add(GetcartitemsStarted());
                        }
                      else {
                        setState(() {
                          quantities[item.itemId] = getCount(item.itemId) - 1;
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey[300]!, width: 0.75),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:5,right:12,left:12,bottom:10),
                child: AppText(
                  text: 'Total',
                  textSize: 20,
                  textColor: colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width:context.horizontal*3),
              AppText(text: '${total.toStringAsFixed(2)} JOD',textSize: 19,fontWeight: FontWeight.bold,textColor: colors.primary,)
            ],
          ),
        ),
        Spacer(),
        Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border(
      top: BorderSide(color: Colors.grey[300]!, width: 0.75),
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: Colors.grey[200],
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (_) => PaymentMethodSheet(
              selected: _selectedMethod,
              onChanged: (method) {
                setState(() {
                  _selectedMethod = method;
                });
              },
            ),
          );
        },
        child: Row(
          children: [
            _selectedMethod == 'cash' ? Icon(Icons.local_atm, color: colors.primary) : Image.asset('assets/images/visa.png', width: 40, height: 25, fit: BoxFit.contain ),
            const SizedBox(width: 8),
            AppText(text: _selectedMethod == 'cash' ? 'Cash' : 'My Card', fontWeight: FontWeight.bold, textColor: colors.primary),
            Icon(Icons.keyboard_arrow_down, color: colors.primary),
          ],
        ),
      ),
      Button(
        onPressed: () async {
          for (final item in widget.items) {
          await getIt<AddPurchasesCubit>().addPurchase(
          item.name,
          item.price.toDouble(),
          item.image,
      );}
        },
        text: 'Pay ${total.toStringAsFixed(2)} JOD',
        textColor: colors.onPrimary,
        borderRadius: 24,
        fontSize: 14,
        buttonWidth: 150,
        buttonHeight: 40,
        fontWeight: FontWeight.bold,
        elevation: 4,
      ),
    ],
  ),
),
      ],
    );
  }
}