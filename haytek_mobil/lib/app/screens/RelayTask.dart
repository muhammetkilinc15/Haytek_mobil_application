import 'package:flutter/material.dart';

class RelayTask extends StatefulWidget {
  const RelayTask({super.key});

  @override
  _RelayTaskState createState() => _RelayTaskState();
}

class _RelayTaskState extends State<RelayTask> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime)
      setState(() {
        _selectedTime = pickedTime;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarih ve Saat Seçimi',style: TextStyle(
        color: Colors.white, 
        
        )
       ),
       iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _selectedDate == null
                  ? 'Tarih seçilmedi'
                  : 'Seçilen Tarih: ${_selectedDate!.toLocal()}',
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Tarih Seç'),
            ),
           const  SizedBox(height: 16.0),
            Text(
              _selectedTime == null
                  ? 'Saat seçilmedi'
                  : 'Seçilen Saat: ${_selectedTime!.format(context)}',
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('Saat Seç'),
            ),
          ],
        ),
      ),
    );
  }
}