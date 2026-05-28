import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_feild.dart';
import 'package:makanek/features/addproduct/presentation/bloc/addproduct_bloc.dart';
import 'package:makanek/features/addproduct/presentation/bloc/addproduct_events.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? _selectedProductType;

  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  late String _imagePath;
  bool _imageSelected = false;

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) {
      setState(() {
        _imagePath = image.path;
        _imageSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 420,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputFeild(
              controller: _titleController,
              text: 'Title',
              hideBorder: true,
              keyboardType: TextInputType.text,
              action: TextInputAction.next,
            ),
            TextField(
              controller: _bodyController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: "Describe your product",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              width: context.buttonSize,
              height: context.buttonSizeH,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(234, 228, 228, 228),
                  hintText: 'Product Type',
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(0, 255, 255, 255), width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Food', child: Text('Food')),
                  DropdownMenuItem(value: 'Clothes', child: Text('Clothes')),
                  DropdownMenuItem(value: 'Crafts', child: Text('Crafts')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Product type is required';
                  return null;
                },
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedProductType = value);
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            AppFeild(
              controller: _priceController,
              hintText: 'Price',
              keyboardType: TextInputType.number,
              action: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Price is required';
                if (double.tryParse(value) == null)
                  return 'Enter a valid number';
                return null;
              },
              buttonWidth: context.buttonSize,
              buttonHeight: context.buttonSizeH,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    onPressed: _pickImage,
                    icon: Icon(
                      Icons.photo_library,
                      color: colors.primary,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(width: context.spacer * 4.5),
                Button(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (!_imageSelected) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please select an image')),
                        );
                        return;
                      }
                      context.read<AddproductBloc>().add(AddproductSubmitted(
                            imageUrl: _imagePath,
                            body: _bodyController.text,
                            title: _titleController.text,
                            price: double.parse(_priceController.text),
                            productType: _selectedProductType!,
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