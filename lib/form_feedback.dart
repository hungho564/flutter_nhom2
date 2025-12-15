import 'package:flutter/material.dart';

class FormFeedback extends StatefulWidget {
  const FormFeedback({super.key});

  @override
  State<FormFeedback> createState() => _FormFeedbackState();
}

class _FormFeedbackState extends State<FormFeedback> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _contentCtrl = TextEditingController();

  int? _selectedStar; // 1–5

  @override
  void dispose() {
    _nameCtrl.dispose();
    _contentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gửi phản hồi"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _myBody(),
    );
  }

  Widget _myBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: "Họ tên",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return "Vui lòng nhập họ tên!";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                labelText: "Đánh giá (1 - 5 sao)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.star),
              ),
              initialValue: _selectedStar,
              items: [1, 2, 3, 4, 5]
                  .map((i) => DropdownMenuItem(value: i, child: Text("$i sao")))
                  .toList(),
              onChanged: (v) => setState(() => _selectedStar = v),
              validator: (v) => v == null ? "Vui lòng chọn số sao!" : null,
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _contentCtrl,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Nội dung góp ý",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.message_outlined),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return "Vui lòng nhập nội dung góp ý!";
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            Center(
              child: SizedBox(
                width: 180,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  icon: const Icon(
                    Icons.send,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Gửi phản hồi",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Gửi phản hồi thành công!"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
