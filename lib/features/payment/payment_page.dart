




import 'package:flutter/material.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_feild.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';



class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
} 

class _PaymentPageState extends State<PaymentPage>{
  final TextEditingController _nameController = TextEditingController();
final TextEditingController _cardNumberController = TextEditingController();
final TextEditingController _expiryController = TextEditingController();
final TextEditingController _cvvController = TextEditingController();
final TextEditingController _addressController = TextEditingController();


 
 @override
void dispose() {
  _nameController.dispose();
  _cardNumberController.dispose();
  _expiryController.dispose();
  _cvvController.dispose();
  _addressController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.onPrimary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText(text: 'Payment',textColor: colors.primary,fontWeight: FontWeight.w600,),
          leadingWidth: 90,
          titleSpacing: 40,
          leading:  Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.main),
            child: Row(children: [
              Icon(Icons.arrow_back_ios, color: colors.primary),
              AppText(text: 'Back', fontWeight: FontWeight.bold, textColor: colors.primary, textSize: 16),]
                    )
                  )
                )
            ),
            body: Padding(padding:EdgeInsets.all(16),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              AppText(text: 'Name',textColor: Colors.black,),
              AppFeild(fillColor: const Color.fromARGB(255, 246, 242, 242) ,controller: _nameController,
               keyboardType: TextInputType.name, action: TextInputAction.next, hintText: "Enter your name ", 
               buttonWidth: context.buttonSize*2  , buttonHeight: context.buttonSizeH,
               borderSide: BorderSide(color:const Color.fromARGB(255, 213, 213, 213), width:0.5),),
              SizedBox(height:5),
              AppText(text: 'Card Number',textColor: Colors.black,),
              AppFeild(fillColor: const Color.fromARGB(255, 246, 242, 242) ,controller: _cardNumberController, 
              keyboardType: TextInputType.number, action: TextInputAction.next, 
              hintText: "**** **** **** 2096", buttonWidth: context.buttonSize*2  , 
              buttonHeight: context.buttonSizeH,borderSide: BorderSide(color:const Color.fromARGB(255, 213, 213, 213), width:0.5),),
              SizedBox(height:5),
              Row(
                children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              AppText(text: 'Expiry Date',textColor: Colors.black,),
              AppFeild(fillColor: const Color.fromARGB(255, 246, 242, 242) ,controller: _expiryController, keyboardType: TextInputType.name, 
              action: TextInputAction.next, hintText: "- ", buttonWidth: context.buttonSize/1.55,
               buttonHeight: context.buttonSizeH,borderSide: BorderSide(color:const Color.fromARGB(255, 213, 213, 213), width:0.5),
                      )
                    ]
                 ),
                   SizedBox(width:5),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              AppText(text:'CVV',textColor: Colors.black,),
              AppFeild(fillColor: const Color.fromARGB(255, 246, 242, 242) ,controller:_cvvController, keyboardType: TextInputType.name, 
              action: TextInputAction.next, hintText: "***", buttonWidth: context.buttonSize/1.6,
               buttonHeight: context.buttonSizeH,borderSide: BorderSide(color:const Color.fromARGB(255, 213, 213, 213), width:0.5),
                      )
                    ]
                 )
              ]
              ),
              SizedBox(height:5),
              AppText(text: 'Address',textColor: Colors.black,),
              AppFeild(fillColor: const Color.fromARGB(255, 246, 242, 242) ,controller:  _addressController,
              keyboardType: TextInputType.name, action: TextInputAction.next, hintText: "Enter your Address", 
              buttonWidth: context.buttonSize*2  , buttonHeight: context.buttonSizeH,
              borderSide: BorderSide(color:const Color.fromARGB(255, 213, 213, 213), width:0.5),),
              Spacer(),
              Divider(thickness: 0.75, color: colors.onSurface.withValues(alpha: 0.1)),
               Button(
                textColor: colors.onPrimary
               ,borderRadius:18 , fontSize: 18, text: "Add card", buttonWidth: context.buttonSize, buttonHeight: context.buttonSizeH, fontWeight: FontWeight.bold, elevation: 4)
          ]
        )
      )
    );
  }
}
