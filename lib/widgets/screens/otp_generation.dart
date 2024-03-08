import 'package:auth/widgets/app_constant.dart';
import 'package:auth/widgets/controller/auth_controller.dart';
import 'package:auth/widgets/date_field.dart';
import 'package:auth/widgets/form.dart';
import 'package:auth/widgets/screens/auth/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthGenerationScreen extends StatefulWidget {
  const AuthGenerationScreen({super.key});

  @override
  State<AuthGenerationScreen> createState() => _AuthGenerationScreenState();
}

class _AuthGenerationScreenState extends State<AuthGenerationScreen> {
  TextEditingController documenttypeController = TextEditingController();
  TextEditingController documentnoController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController itemcodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController qunatityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController autherisationcodeController = TextEditingController();
  int? varTipoDoc;
  String? varNumDoc;
  String? varArtigo;
  double? varPreco;
  int? varQuant;
  int? varData;
  var myAuthCode;
  int? varDiscco;
  final _formKey = GlobalKey<FormState>();
  var dropval;

  // Send Mail function
  void sendMail(
    String recipientEmail,
  ) async {
    // change your email here
    String username = 'it.department@electromaxsa.com';
    // change your password here
    String password = 'puwsmrzkwpsvpjls';
    final smtpServer = SmtpServer(
      "smtp.bizmail.yahoo.com",
      port: 465,
      ssl: true,
      username: username,
      password: password,
    );
    final message = Message()
      ..from = Address(username, 'Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Authorizations Code'
      ..text =
          'This is your generated authorizations code : ${autherisationcodeController.text}\n\n Authorized by : ${storedEmail}\n\n Reference with : ${Get.find<AuthController>().selectedDate}/${dropval}/${documentnoController.text}/${itemcodeController.text}/${qunatityController.text}/${_selectedValue == 1 ? priceController.text : discountController.text}';
    print("---------------->>>>>");
    //  //print(dat.mail);
    //  var dat = await send(message, smtpServer);
    //  print(dat.mail);
    //  print(dat.mail);
    //  print(dat.connectionOpened);
    //  print(dat.messageSendingEnd);
    //  print(dat.messageSendingStart);
    try {
      await send(message, smtpServer);
      print("-------on success");
      AppConstant.showSnackbar(
        headText: "Successful",
        content: "Email has been sent to ${recipientEmail}",
        position: SnackPosition.BOTTOM,
      );
      Get.offAll(SplashScreen());
    } catch (e) {
      Get.rawSnackbar(
        messageText: Text(
          'Failed :${e}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      print("-------on f");

      print(e.toString());
    }
  }

  String? storedEmail;

  @override
  void initState() {
    super.initState();
    getEmailFromStorage();
  }

  Future<void> getEmailFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      storedEmail = prefs.getString('email');
    });
  }

  int _selectedValue = 1;

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
                  value: dropval,
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
                  items: <String>[
                    "FR",
                    "FA"
                  ] // Make sure there are no duplicates here
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 10, bottom: 7, top: 4),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors
                              .red), // Border color when field is focused and has error
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                          width: 1,
                          color:
                              Colors.red), // Border color when field has error
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors
                              .blue), // Border color when field is focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.black
                              .withOpacity(.50)), // Default border color
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),

                // SizedBox(
                //   height: 15,
                // ),
                // SizedBox(
                //   height: 15,
                // ),
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
                  child: MyDatePicker(dateEditingController: dateController),
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
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    Text('Price'),
                    Radio(
                      value: 2,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    Text('Percentage'),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                _selectedValue == 1
                    ? MyForm(
                        headingText: 'Price',
                        textEditingController: priceController)
                    : Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Percentage',
                                style: secondaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: discountController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a value';
                              }
                              // final number = int.tryParse(value);
                              // if (number == null || number < 0 || number > 100) {
                              //   return 'Please enter a number between 1 and 100';
                              // }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              RangeTextInputFormatter(max: 100),
                            ],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 7, top: 4),
                              //  labelText: 'Enter a number between 1 and 100',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
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
                              _showDialog(context);
                              // sendEmail(
                              //   autherisationcodeController.text
                              // );
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
                       
                        if( _selectedValue == 1){
print("---------------------on price calc");
                        varTipoDoc = 349869;
                        }else{
print("---------------------on disc calc");
                        varTipoDoc = 569842;
                        }
                        
                      } else if (txtdoctype.toUpperCase() == "FA") {
                        
                           if( _selectedValue == 1){
print("---------------------on price calc");
                          varTipoDoc = 985217;
                           }else{
print("---------------------on disc calc");
                            varTipoDoc = 569249;
                           }
                        
                      }

                      // Convert varNumDoc, varArtigo, varPreco, varQuant to the required types
                      varNumDoc = documentnoController.text;
                      print('----------------5-----------');
                      varArtigo = itemcodeController.text;
                      print('----------------6-----------');
                      print('----------------7-----------');
                      varQuant = int.parse(qunatityController.text);
                      print('----------------8-----------');
                      _selectedValue == 1
                          ? varPreco = double.parse(priceController.text)
                          : varDiscco = int.parse(discountController.text);
                      print('----------------9-----------');

                      String dateString = dateController.text.toString();
                      // Assuming dateController.text contains a date in the format "YYYYMMDD"

                      print('-----------------10-----------------');
                      print(
                          '-----------------${(dateController.text.toString())}-----------------');
                      print(
                          '-----------------${varArtigo.toString()}-----------------');
                      //   print('-----------------${varPreco!}---------PRICE--------');
                      print('-----------------${varTipoDoc!}-----------------');
                      //R print('-----------------${varDiscco!}-----DISCONT-----------');
                      print('-----------------${varQuant!}-----------------');
                      print(
                          '-----------------${dateString}----date-----${_selectedValue}--------');
                      //  _selectedValue==1?Text('price'):    print('-----------------${varDiscco}-----discount------------');

                      // Logic to calculate myAuthCode
                      _selectedValue == 1
                          ? myAuthCode = ((7 + 8) * 5) +
                              varTipoDoc! * int.parse(varNumDoc.toString()) +
                              int.parse(dateString) +
                              int.parse(varArtigo.toString()) +
                              varPreco! * varQuant!
                          : myAuthCode = ((9 + 7) * 8) +
                              varTipoDoc! * int.parse(varNumDoc.toString()) +
                              int.parse(dateString) +
                              int.parse(varArtigo.toString()) +
                              varDiscco! * varQuant!;
                      print('----------------5-----------');

                      // Assuming DaAuthcode is another variable to store the result
                      int? DaAuthcode = myAuthCode.toInt();

                      // Set the result to a text field
                      setState(() {
                        autherisationcodeController.text =
                            DaAuthcode.toString();
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

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FittedBox(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    TextEditingController recipientController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Send Email'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: recipientController,
                decoration: InputDecoration(
                  labelText: 'Recipient Email',
                  hintText: 'Enter recipient email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipient email';
                  }
                  return null;
                },
              ),
              // TextField(
              //   controller: messageController,
              //   decoration: InputDecoration(labelText: 'Message'),
              // ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                AppConstant.showLoader(context: context);
                sendMail(
                  recipientController.text,
                );

                // _sendMail(
                //   recipientController.text,
                //   messageController.text,
                // );
              },
              child: Text('Send'),
            ),
          ],
        );
      },
    );
  }

  void _sendMail(String recipientEmail, String mailMessage) async {
    String username = 'it.department@electromaxsa.com';
    String password = 'puwsmrzkwpsvpjls';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Mail'
      ..text = 'Message: $mailMessage';

    try {
      await send(message, smtpServer);
      _showSnackbar(context, 'Email sent successfully');
    } catch (e) {
      _showSnackbar(context, 'Failed to send email: $e');
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
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
      'body': 'Hi , This is your Authorizations Code: $authCode'
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

// import 'package:flutter/services.dart';

class RangeTextInputFormatter extends TextInputFormatter {
  final int? min;
  final int? max;

  RangeTextInputFormatter({this.min, this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      // Allow empty input
      return newValue;
    }

    final number = int.tryParse(newValue.text);
    if (number == null ||
        (min != null && number < min!) ||
        (max != null && number > max!)) {
      // Return the old value if the new value is not within the specified range
      return oldValue;
    }
    return newValue;
  }
}
