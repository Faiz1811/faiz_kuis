import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  bool _isPasswordVisible = false;

  // Contoh username dan password untuk validasi
  final String validUsername = 'admin';
  final String validPassword = 'admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                'assets/images/logo.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/illustration.png',
                height: 150,
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                  
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        _username = value!.trim();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Password Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_isPasswordVisible,
                      onSaved: (value) {
                        _password = value!.trim();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Login Button
                    ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50), // Full width
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 10),
                    // Registration Button
                    TextButton(
                      onPressed: _handleRegistration,
                      child: const Text('Registrasi'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Validasi username dan password
      if (_username == validUsername && _password == validPassword) {
        // Navigasi ke halaman home dengan mengirimkan username
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: _username,
        );
      } else {
        // Tampilkan snackbar jika login gagal
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username atau password salah')),
        );
      }
    }
  }

  void _handleRegistration() {
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Registrasi'),
        content: const Text('Maap baru ada button nya HEHEHEHHEHE'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
