import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';
import 'package:makanek/features/getpurchases/presentation/bloc/getpurchases_bloc.dart';
import 'package:makanek/features/getpurchases/presentation/bloc/getpurchases_events.dart';

class GetpurchasesLayout extends StatefulWidget {
  final List<Addpurchasesoutput> purchases;
  const GetpurchasesLayout({
    super.key, required this.purchases
  });

  @override
  State<GetpurchasesLayout> createState() => _GetpurchasesLayoutState();
}

class _GetpurchasesLayoutState extends State<GetpurchasesLayout> {

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              AppTitle(
                size: 35,
                title: 'Purchases',
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
                top: BorderSide(
                  color: Colors.grey[300]!,
                  width: 0.75,
                ),
              ),
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetpurchasesBloc>().add(
                      PurchaseSubmitted(),
                    );
              },
              child: ListView.builder(
                itemCount: widget.purchases.length,
                itemBuilder: (context, index) {
                  final purchase = widget.purchases[index];

                  return Container(
                    width: context.horizontal,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 219, 219, 219),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        purchase.imageUrl != null && purchase.imageUrl!.isNotEmpty
                        ? Image.network(purchase.imageUrl!, width: 50, height: 50, fit: BoxFit.cover)
                        : const Icon(Icons.image, size: 50),
                        const SizedBox(width: 16),
                        Expanded(
                          child: AppText(
                            text: purchase.title,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText(
                              text: purchase.date.toString(),
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: context.vertical / 2),
                            AppText(
                              text: ' JOD ${purchase.price.toString()}',
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ], 
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}