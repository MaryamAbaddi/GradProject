import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_feild.dart';
import 'package:makanek/features/addservice/presentation/bloc/addservice_bloc.dart';
import 'package:makanek/features/addservice/presentation/bloc/addservice_events.dart';

class AddServiceForm extends StatefulWidget {
  const AddServiceForm({super.key});

  @override
  State<AddServiceForm> createState() => _AddServiceFormState();
}

class _AddServiceFormState extends State<AddServiceForm> {
  final TextEditingController _serviceTypeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _serviceTypeController.dispose();
    _phoneNumberController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.buttonSize,
              height: context.buttonSizeH,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(234, 228, 228, 228),
                  hintText: 'Service Type',
                  hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color.fromARGB(0, 255, 255, 255), width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'House Keeping', child: Text('House Keeping')),
                  DropdownMenuItem(value: 'Baby sitting', child: Text('Baby sitting')),
                  DropdownMenuItem(value: 'Private Teaching', child: Text('Private Teaching')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Service type is required';
                  return null;
                },
                onChanged: (value) {
                  if (value != null) {
                    _serviceTypeController.text = value;
                  }
                },
              ),
            ),
            SizedBox(height: context.vertical / 3),
            AppFeild(
              controller: _phoneNumberController,
              hintText: 'Phone(+962)',
              keyboardType: TextInputType.phone,
              action: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number is required';
                }
                final phoneRegex = RegExp(r'^[0-9]{10}$');
                if (!phoneRegex.hasMatch(value)) {
                  return 'Must be exactly 10 digits';
                }
                return null;
              },
              buttonWidth: context.buttonSize,
              buttonHeight: context.buttonSizeH,
            ),
            SizedBox(height: context.vertical / 3),
            AppFeild(
              controller: _priceController,
              hintText: 'Price/hr',
              keyboardType: TextInputType.number,
              action: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Price is required';
                if (double.tryParse(value) == null) return 'Enter a valid number';
                return null;
              },
              buttonWidth: context.buttonSize,
              buttonHeight: context.buttonSizeH,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AddserviceBloc>().add(AddserviceSubmitted(
                        serviceType: _serviceTypeController.text,
                        phoneNumber: _phoneNumberController.text,
                        price: double.parse(_priceController.text),
                      ));
                    }
                  },
                  textColor: colors.onPrimary,
                  borderRadius: 28,
                  fontSize: 14,
                  text: 'Post',
                  buttonWidth: 70,
                  fontWeight: FontWeight.w600,
                  elevation: 0,
                  buttonHeight: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
