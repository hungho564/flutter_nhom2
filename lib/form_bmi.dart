import 'package:flutter/material.dart';

class FormBmi extends StatefulWidget {
  const FormBmi({super.key});

  @override
  State<FormBmi> createState() => _FormBmiState();
}

class _FormBmiState extends State<FormBmi> {
  final _formKey = GlobalKey<FormState>();
  final _heightCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();

  double? _bmi;
  String _category = "";

  @override
  void dispose() {
    _heightCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tính chỉ số BMI'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                TextFormField(
                  controller: _heightCtrl,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Chiều cao (m)',
                    hintText: 'Ví dụ: 1.7',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.height),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Vui lòng nhập chiều cao!';
                    }
                    final h = double.tryParse(v);
                    if (h == null || h <= 0) {
                      return 'Chiều cao không hợp lệ!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                TextFormField(
                  controller: _weightCtrl,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Cân nặng (kg)',
                    hintText: 'Ví dụ: 60',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Vui lòng nhập cân nặng!';
                    }
                    final w = double.tryParse(v);
                    if (w == null || w <= 0) {
                      return 'Cân nặng không hợp lệ!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),


                Center(
                  child: SizedBox(
                    width: 180,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: _calculateBMI,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Tính BMI',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),


                if (_bmi != null) _resultCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _calculateBMI() {
    if (!_formKey.currentState!.validate()) return;

    final h = double.parse(_heightCtrl.text.trim());
    final w = double.parse(_weightCtrl.text.trim());

    final bmi = w / (h * h);

    setState(() {
      _bmi = bmi;
      _category = _classifyBMI(bmi);
    });
  }


  String _classifyBMI(double bmi) {
    if (bmi < 18.5) return "Thiếu cân";
    if (bmi < 25) return "Bình thường";
    if (bmi < 30) return "Thừa cân";
    return "Béo phì";
  }


  Widget _resultCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Chỉ số BMI: ${_bmi!.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Phân loại: $_category",
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
