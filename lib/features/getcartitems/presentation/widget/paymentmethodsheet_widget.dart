import 'package:flutter/material.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';

class PaymentMethodSheet extends StatefulWidget {
  final String selected;
  final Function(String) onChanged;

  const PaymentMethodSheet({super.key, required this.selected, required this.onChanged});

  @override
  State<PaymentMethodSheet> createState() => _PaymentMethodSheetState();
}

class _PaymentMethodSheetState extends State<PaymentMethodSheet> {
  late String _selected;
  String _cardName = 'My card'; 
  

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: 'Payment method', fontWeight: FontWeight.bold, textSize: 18),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RadioGroup<String>(
            groupValue: _selected,
            onChanged: (val) => setState(() => _selected = val!),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                   color: const Color.fromARGB(255, 209, 209, 209),
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: AppText(text: 'Credit & debit cards', fontWeight: FontWeight.w600, textSize: 14),
                          ),
                          TextButton(
                            onPressed: () { 
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(context,AppRoutes.payment).then((cardName)
                            {
                              if(cardName != null)
                              {
                                setState(() {
                                  _cardName = cardName as String;
                                });
                              }
                            }
                            );
                            },
                            child: AppText(text: 'Add card +', textColor: colors.primary, textSize: 14),
                          ),
                        ],
                      ),
                      const Divider(height: 1),
                      RadioListTile<String>(
                        value: 'card',
                        activeColor: colors.primary,
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Row(
                          children: [
                            Image.asset('assets/images/visa.png', width: 40, height: 25, fit: BoxFit.contain),
                            const SizedBox(width: 8),
                            AppText(text: 'My card', fontWeight: FontWeight.w500),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 209, 209),
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: RadioListTile<String>(
                    value: 'cash',
                    activeColor: colors.primary,
                    controlAffinity: ListTileControlAffinity.trailing,

                    title: Row(
                      children: [
                        Icon(Icons.local_atm, color: colors.primary),
                        const SizedBox(width: 8),
                        AppText(text: 'Cash', fontWeight: FontWeight.w500),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
         
          Button(
            onPressed: () {
              widget.onChanged(_selected);
                Navigator.pop(context);
            },
          textColor: colors.onPrimary, borderRadius: 18 , fontSize: 18, text: 'Confirm', buttonWidth: context.buttonSize, buttonHeight:context.buttonSizeH , fontWeight: FontWeight.bold, elevation: 2),
          const SizedBox(height: 35),

        ],
      ),
    );
  }
}
