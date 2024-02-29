import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for LengthLimitingTextInputFormatter
import 'package:google_fonts/google_fonts.dart';

class MyForm extends StatelessWidget {
  final String headingText;
  final TextEditingController textEditingController;

  MyForm({
    required this.headingText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          headingText,
           style: secondaryFonts.copyWith(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
        ),
        SizedBox(height: 5), // You can use SizedBox for spacing
        TextFormField(
          keyboardType: TextInputType.number,
          controller: textEditingController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a value'; // Return an error message if the value is empty
            } 
            return null; // Return null if the input is valid
          },
          inputFormatters: [LengthLimitingTextInputFormatter(10)], // Limit the input length to 10 characters
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, bottom: 7, top: 4),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(width: 1, color: Colors.red), // Border color when field is focused and has error
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(width: 1, color: Colors.red), // Border color when field has error
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(width: 1, color: Colors.blue), // Border color when field is focused
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(width: 1, color: Colors.black.withOpacity(.50)), // Default border color
            ),
          ),
        ),
        SizedBox(height: 15), // Adjust the size according to your design
      ],
    );
  }
}

var secondaryFonts = GoogleFonts.lexend();
const SizedBox ksizedbox5 = SizedBox(height: 5);
const SizedBox ksizedbox10 = SizedBox(height: 10);
const SizedBox ksizedbox15 = SizedBox(height: 15);
const SizedBox ksizedbox20 = SizedBox(height: 20);
const SizedBox ksizedbox30 = SizedBox(height: 30);
const SizedBox ksizedbox40 = SizedBox(height: 40);
class AppColors {
  static const Color red = Color(0xFFF00000);
  static const Color primaryColor = Color(0xFFF00000);
  static const Color redAccent = Color(0xFFE10000);
  static const Color black = Color(0xFF000000);
  static const Color policyBlack = Color(0xFF263238);
  static const Color lightGrey = Color(0xFFB3B3B3);
  static const Color grey = Color(0xFFD9D9D9);
  static const Color darkGrey = Color(0xFF4B4B4A);
  static const Color darklightGrey = Color(0xFFAAAAAA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color yellow = Color(0xFFFFBB24);
  static const Color lightRed = Color(0xFFFF4A4A);
  static const Color green = Color(0xFF77B43F);
  static const Color containerGrey = Color(0xFFFAFAFA);
  static const Color bookingContainerGrey = Color(0xFFF8F8F8);
  static const Color darkGreen = Color(0xFF2A7828);
  static const Color blue = Color(0xFF1675DB);
  static const Color purpule = Color(0xFF551D69);
  static const Color cyan = Color(0xFF219F98);
  static const Color pink = Color(0xFFE10094);
  static const Color navyBlue = Color(0xFF406E99);
  static const Color skyBlue = Color(0xFF707DD3);
}




