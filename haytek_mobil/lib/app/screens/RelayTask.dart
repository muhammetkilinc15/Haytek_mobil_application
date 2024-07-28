import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        title: const Text(
          'Tarih ve Saat Seçimi',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Röleyi progralamak için bir tarih ve saat değeri girin',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16.0),
            _buildDateCard(context),
            const SizedBox(height: 16.0),
            _buildTimeCard(context),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                child: const Text(
                  'Röle Programla',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateCard(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          _selectedDate == null
              ? 'Tarih seçilmedi'
              : 'Seçilen Tarih: ${_selectedDate!.toLocal().toShortDateString()}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.calendar_today_rounded),
          color: Colors.blue,
          onPressed: () => _selectDate(context),
        ),
      ),
    );
  }

  Widget _buildTimeCard(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          _selectedTime == null
              ? 'Saat seçilmedi'
              : 'Seçilen Saat: ${_selectedTime!.format(context)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.access_time_rounded),
          color: Colors.blue,
          onPressed: () => _selectTime(context),
        ),
      ),
    );
  }
}

extension DateTimeExtensions on DateTime {
  String toShortDateString() {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(this);
  }
}
