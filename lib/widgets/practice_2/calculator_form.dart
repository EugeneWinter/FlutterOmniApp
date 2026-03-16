// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CalculatorForm extends StatefulWidget {
  const CalculatorForm({super.key});

  @override
  State<CalculatorForm> createState() => _CalculatorFormState();
}

class _CalculatorFormState extends State<CalculatorForm> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController monthController = TextEditingController();

  double interest = 0.0;
  double totalResult = 0.0;
  Key _animationKey = UniqueKey();

  void totalCalculate() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    double months = double.tryParse(monthController.text) ?? 0.0;

    double calcResult = (rate / 100 / 12) * months;
    double calcTotalInterest = calcResult * amount;

    setState(() {
      interest = calcTotalInterest;
      totalResult = amount + interest;
      _animationKey = UniqueKey(); 
    });
    
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    amountController.dispose();
    rateController.dispose();
    monthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputField('Депозит', 'Руб', amountController),
        const SizedBox(height: 20),
        _buildInputField('%', '% годовых', rateController),
        const SizedBox(height: 20),
        _buildInputField('Месяцев', '0 - 12', monthController),
        
        const SizedBox(height: 35),
        
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: totalCalculate,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              shadowColor: Colors.deepPurpleAccent.withOpacity(0.4),
            ),
            child: const Text(
              'Рассчитать',
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        
        const SizedBox(height: 40),
        
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.deepPurpleAccent.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Результат:', style: TextStyle(fontSize: 18, color: Colors.white70)),
              const SizedBox(height: 15),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('% :', style: TextStyle(fontSize: 20, fontFamily: 'monospace', color: Colors.white)),
                  _buildAnimatedNumber(interest, Colors.purpleAccent.shade200),
                ],
              ),
              const SizedBox(height: 15),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Итого :', style: TextStyle(fontSize: 20, fontFamily: 'monospace', color: Colors.white)),
                  _buildAnimatedNumber(totalResult, Colors.greenAccent),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildInputField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white70, fontFamily: 'monospace'),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white30),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedNumber(double targetValue, Color color) {
    return TweenAnimationBuilder<double>(
      key: _animationKey,
      tween: Tween<double>(begin: 0, end: targetValue),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeOutExpo,
      builder: (context, value, child) {
        return Text(
          value.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
            color: color,
          ),
        );
      },
    );
  }
}