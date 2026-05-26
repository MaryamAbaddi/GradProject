import 'package:flutter/material.dart';
import 'package:makanek/core/utils/responisve_utils.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
    final void Function(String) onSubmitted;



  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged, 
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(child:SizedBox(width: context.screenWidth *0.95 ,
    height: context.screenHeight/24,
    child:
    SearchBar(
  onSubmitted: onSubmitted,
  controller: controller,
  onChanged: onChanged,
  hintText: 'Search for crafts, communities, or workshops...',
  leading: Icon(Icons.search, color: colors.primary ), 
  hintStyle: const WidgetStatePropertyAll(
    TextStyle(color: Color.fromARGB(255, 112, 109, 109)),                         
  ),
  textStyle: const WidgetStatePropertyAll(
    TextStyle(color: Color.fromARGB(255, 24, 24, 24)),                       
  ),
  backgroundColor: const WidgetStatePropertyAll(
    Color.fromARGB(244, 232, 229, 229),                                          
  ),
  shape:  WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
  padding: const WidgetStatePropertyAll(
    EdgeInsets.symmetric(horizontal: 16),
  ),
          )
       )
    );
  }
}