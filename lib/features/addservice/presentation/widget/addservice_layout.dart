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
            AppFeild(
              controller: _serviceTypeController,
              hintText: 'Service Type',
              keyboardType: TextInputType.text,
              action: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Service type is required';
                return null;
              },
              buttonWidth: context.buttonSize,
              buttonHeight: context.buttonSizeH,
            ),
            AppFeild(
              controller: _phoneNumberController,
              hintText: 'Phone Number',
              keyboardType: TextInputType.phone,
              action: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Phone number is required';
                return null;
              },
              buttonWidth: context.buttonSize,
              buttonHeight: context.buttonSizeH,
            ),
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