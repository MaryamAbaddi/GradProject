




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
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
  
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  String? _imagePath;

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             SizedBox(height: context.spacer),
            InputFeild(
              controller: _titleController,
              text: 'Title',
              keyboardType: TextInputType.text,
              action: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Title is required';
                if (value.length < 3) return 'Title must be at least 3 characters';
                return null;
              },),
            TextField(
              controller: _bodyController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Describe your product",
                hintStyle: TextStyle(
                  color: colors.primary,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                
                border: InputBorder.none,
              ),
            ),
              InputFeild(
              controller: _priceController,
              text: 'Price',
              keyboardType: TextInputType.number,
              action: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Price is required';
                if (double.tryParse(value) == null) return 'Enter a valid number';
                return null;
              },
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
                      context.read<AddproductBloc>().add(AddproductSubmitted(
                            imageUrl: _imagePath,
                            body: _bodyController.text,
                            title:_titleController.text,
                           price: ''));
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