import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_nhom2/Bai_12/profile.dart';

class ProfileLogin extends StatefulWidget {
  const ProfileLogin({super.key});

  @override
  State<ProfileLogin> createState() => _ProfileLoginState();
}

class _ProfileLoginState extends State<ProfileLogin> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);

    try {
      final res = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _usernameCtrl.text.trim(),
          'password': _passwordCtrl.text.trim(),
        }),
      );

      setState(() => _isLoading = false);

      if (res.statusCode == 200) {
        final userData = jsonDecode(res.body);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ProfileScreen(userData: userData),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sai tài khoản hoặc mật khẩu'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi kết nối: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form đăng nhập"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),

                  TextFormField(
                    controller: _usernameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Tên người dùng',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Vui lòng nhập tên!' : null,
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _passwordCtrl,
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => _obscure = !_obscure),
                        icon: Icon(_obscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    validator: (v) =>
                        v != null && v.length >= 6
                            ? null
                            : 'Mật khẩu tối thiểu 6 ký tự!',
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 42,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.login),
                      label: Text(
                          _isLoading ? 'Đang xử lý...' : 'Đăng nhập'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _isLoading ? null : _submit,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
