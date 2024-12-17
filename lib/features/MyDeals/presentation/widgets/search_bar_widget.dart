 import 'package:flutter/material.dart';

import '../../../../core/custom/widgets/custom_text_from_field.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Directionality(

      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomTextFromField(
          hintText: 'إبحث عن صفقات',
          prefixIcon: const Icon(
            Icons.search,
            size: 20,
            color: Colors.grey,
          ),
          validator: (value) {},

          // Using the controller from homeController
          controller: TextEditingController(),
          textInputType: TextInputType.text,
          obscureText: false,
          maxLines: 1,
          enabled: true,
          inputColor: Colors.black54,

          // Conditionally show close icon if there's text
          suffixIcon:  null
              ,
        ),
      ),
    );
  }
}
