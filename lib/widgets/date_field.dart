import 'package:auth/widgets/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDatePicker extends StatefulWidget {
  final TextEditingController dateEditingController;

  const MyDatePicker({Key? key, required this.dateEditingController})
      : super(key: key);

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime? _selectedDate;

 

  Future<void> _selectDate(BuildContext context) async {
     Get.lazyPut(()=>AuthController());
      final authController = Get.find<AuthController>();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
// int varData(DateTime dt){
//   // Extract year and month components from DateTime object
//   int year = dt.year;
//   int month = dt.month;

//   // Perform the calculation
//   double result = (year * 2 / 3) * (month * 2);
//   return result.toInt();
// }

        _selectedDate = picked;
authController.selectedDate = "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}";
authController.update();
        var result = (_selectedDate!.year * 2 / 3) * (_selectedDate!.month * 2);
        widget.dateEditingController.text = result.toInt().toString();
        //   '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                _selectedDate == null
                    ? 'Select Date'
                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              ),
            ),
            Icon(
              Icons.calendar_month,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
