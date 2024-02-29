import 'package:auth/widgets/date_field.dart';
import 'package:auth/widgets/dropdoen.dart';
import 'package:auth/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthGenerationScreen extends StatefulWidget {
  const AuthGenerationScreen({super.key});

  @override
  State<AuthGenerationScreen> createState() => _AuthGenerationScreenState();
}

class _AuthGenerationScreenState extends State<AuthGenerationScreen> {
  TextEditingController documenttypeController = TextEditingController();
  TextEditingController documentnoController = TextEditingController();
  TextEditingController itemcodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController qunatityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController autherisationcodeController = TextEditingController();
  int? varTipoDoc;
  String? varNumDoc;
  String? varArtigo;
  int? varPreco;
  int? varQuant;
  int? varData;
  int? myAuthCode;
  final _formKey = GlobalKey<FormState>();
   var dropval;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'AUTHORIZATION CODE',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ksizedbox20,
                SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    Text(
                      'Document Type',
                    style: secondaryFonts.copyWith(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5), // You can use SizedBox for spacing
                DropdownButtonFormField<String>(
  value:dropval,
  onChanged: (String? newValue) {
   setState(() {
  dropval = newValue!;
  // widget.textFieldController.text = newValue;
});
  },
  validator: (value) {
    if (value!.isEmpty) {
      return 'Please select a value'; // Return an error message if no value is selected
    }
    return null; // Return null if the selection is valid
  },
  items: <String>["FR","FA"] // Make sure there are no duplicates here
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
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
                 SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                MyForm(
                  headingText: 'Document Number',
                  textEditingController: documentnoController,
                ),
                SizedBox(
                  height: 15,
                ),
                MyForm(
                  headingText: 'Item Code',
                  textEditingController: itemcodeController,
                ),
                SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    Text(
                      'Date',
                      style: secondaryFonts.copyWith(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  //height: 50,
                  child: MyDatePicker(
                    dateEditingController: dateController,
                  ),
                ),
                  SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                MyForm(
                    headingText: 'Qunatity',
                    textEditingController: qunatityController),
                SizedBox(
                  height: 15,
                ),
                MyForm(
                    headingText: 'Price',
                    textEditingController: priceController),
                SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    Text(
                      'Authorizations Code',
                      style: secondaryFonts.copyWith(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                ksizedbox5,
                TextFormField(
                  readOnly: true,
                  controller: autherisationcodeController,
                  //    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    suffixIcon: autherisationcodeController.text.isEmpty 
                        ? Text('')
                        : InkWell(
                            onTap: () {
                              sendEmail(
                                autherisationcodeController.text
                              );
                            },
                            child: Icon(
                              Icons.send,
                              color: Colors.blue,
                            ),
                          ),
                    contentPadding:
                        const EdgeInsets.only(left: 10, bottom: 7, top: 4),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.black.withOpacity(.50))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.black.withOpacity(.50))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.black.withOpacity(.50))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.black.withOpacity(.50))),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print(
                          '-------------------------documenttype${documenttypeController.text}---------------');
                      print(
                          '-----------------------documentno${documentnoController.text}-------------------');
                      print(
                          '------------------itemcode${itemcodeController.text}--------------------');
                      print(
                          '--------------------date${dateController.text}------------------------------');
                      print(
                          '------------------------qunatity${qunatityController.text}--------------------');
                      print(
                          '---------------------------price${priceController.text}-----------------------');
                      String txtdoctype = dropval;
                      if (txtdoctype.toUpperCase() == "FR") {
                        print('----------------1-----------');
                        varTipoDoc = 349869;
                        print('----------------2-----------');
                      } else if (txtdoctype.toUpperCase() == "FA") {
                        print('----------------3-----------');
                        varTipoDoc = 985217;
                        print('----------------4-----------');
                      }

                      // Convert varNumDoc, varArtigo, varPreco, varQuant to the required types
                      varNumDoc = documentnoController.text;
                      varArtigo = itemcodeController.text;
                      varPreco = int.parse(priceController.text);
                      varQuant = int.parse(qunatityController.text);

                      String dateString = dateController.text.toString();
                      // Assuming dateController.text contains a date in the format "YYYYMMDD"

                      print('-----------------9-----------------');
                      print(
                          '-----------------${(dateController.text.toString())}-----------------');
                      print(
                          '-----------------${varArtigo.toString()}-----------------');
                      print('-----------------${varPreco!}-----------------');
                      print('-----------------${varTipoDoc!}-----------------');
                      print('-----------------${varQuant!}-----------------');
                      print('-----------------${dateString}-----------------');

                      // Logic to calculate myAuthCode
                      myAuthCode = ((7 + 8) * 5) +
                          varTipoDoc! * int.parse(varNumDoc.toString()) +
                          int.parse(dateString) +
                          int.parse(varArtigo.toString()) +
                          varPreco! * varQuant!;
                      print('----------------5-----------');

                      // Assuming DaAuthcode is another variable to store the result
                      int? DaAuthcode = myAuthCode;

                      // Set the result to a text field
                      setState(() {
  autherisationcodeController.text = DaAuthcode.toString();
});
                      

                      print(
                          '------------------------autherisationcode-----${autherisationcodeController.text}-----------------------');

                      print(
                          '=========================${DaAuthcode}==================');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        'Generate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                ksizedbox20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> sendEmail(String authCode) async {
   final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: '',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Authorizations Code',
      'body':'Hi , This is your Authorizations Code: $authCode'
    }),
  );
  launchUrl(emailLaunchUri);
}
String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}