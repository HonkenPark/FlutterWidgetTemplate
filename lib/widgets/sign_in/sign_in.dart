import 'dart:async';

import 'package:flutter/material.dart';
import 'package:widget_template/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isAutoLogin = false;
  String _inputEmail = '';
  String _inputPassword = '';

  void _setLoading(bool state) {
    setState(() {
      _isLoading = state;
    });
  }

  void _setPasswordVisible(bool state) {
    setState(() {
      _isPasswordVisible = state;
    });
  }

  void _setAutoLogin(bool state) {
    setState(() {
      _isAutoLogin = state;
    });
  }

  void _updateInputEmail(String input) {
    setState(() {
      _inputEmail = input;
    });
  }

  void _updateInputPassword(String input) {
    setState(() {
      _inputPassword = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = setScreenFit(MediaQuery.of(context).size.shortestSide);

    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: screenSize == ScreenSize.mobileScreen
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const _Logo(),
                        _FormContent(
                          isLoading: _isLoading,
                          setLoading: _setLoading,
                          isPasswordVisible: _isPasswordVisible,
                          setPasswordVisible: _setPasswordVisible,
                          isAutoLogin: _isAutoLogin,
                          setAutoLogin: _setAutoLogin,
                          inputEmail: _inputEmail,
                          updateInputEmail: _updateInputEmail,
                          inputPassword: _inputPassword,
                          updateInputPassword: _updateInputPassword,
                        ),
                      ],
                    )
                  : Container(
                      padding: const EdgeInsets.all(32.0),
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Row(
                        children: [
                          const Expanded(child: _Logo()),
                          Expanded(
                            child: Center(
                                child: _FormContent(
                              isLoading: _isLoading,
                              setLoading: _setLoading,
                              isPasswordVisible: _isPasswordVisible,
                              setPasswordVisible: _setPasswordVisible,
                              isAutoLogin: _isAutoLogin,
                              setAutoLogin: _setAutoLogin,
                              inputEmail: _inputEmail,
                              updateInputEmail: _updateInputEmail,
                              inputPassword: _inputPassword,
                              updateInputPassword: _updateInputPassword,
                            )),
                          ),
                        ],
                      ),
                    )),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = setScreenFit(MediaQuery.of(context).size.shortestSide);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterLogo(size: screenSize == ScreenSize.mobileScreen ? 100 : 200),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Widget Template App",
            textAlign: TextAlign.center,
            style: screenSize == ScreenSize.mobileScreen ? Theme.of(context).textTheme.headlineSmall : Theme.of(context).textTheme.headlineMedium,
          ),
        )
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  final bool isLoading;
  final Function(bool) setLoading;
  final bool isPasswordVisible;
  final Function(bool) setPasswordVisible;
  final bool isAutoLogin;
  final Function(bool) setAutoLogin;
  final String inputEmail;
  final Function(String) updateInputEmail;
  final String inputPassword;
  final Function(String) updateInputPassword;

  const _FormContent({
    super.key,
    required this.isLoading,
    required this.setLoading,
    required this.isPasswordVisible,
    required this.setPasswordVisible,
    required this.isAutoLogin,
    required this.setAutoLogin,
    required this.inputEmail,
    required this.updateInputEmail,
    required this.inputPassword,
    required this.updateInputPassword,
  });

  @override
  State<_FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<_FormContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() {
    widget.setLoading(true);
    Timer(const Duration(seconds: 2), () {
      if (false) {
        /// [Login Success]
      } else {
        _showErrorSnackBar(context, false, '에러가 발생하였습니다.');
      }
      widget.setLoading(false);
    });
  }

  void _showErrorSnackBar(BuildContext context, bool isSuccess, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess ? const Color(0xFF24B945) : const Color(0xFFDB5950),
        content: Text(
          error,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: widget.inputEmail,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // add email validation
                if (value == null || value.isEmpty) {
                  return '이메일 주소가 입력되지 않았습니다.';
                }

                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                if (!emailValid) {
                  return '올바른 이메일 형식이 아닙니다.';
                }

                return null;
              },
              onChanged: (value) => widget.updateInputEmail(value),
              decoration: InputDecoration(
                labelText: '이메일',
                hintText: '이메일을 입력하세요',
                prefixIcon: const Icon(Icons.email_outlined),
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    // _emailController.clear();
                    // controller.toggleClearEmailVisible(false);
                  },
                  child: const Icon(
                    true ? Icons.highlight_remove : null,
                  ),
                ),
              ),
            ),
            _gap(),
            TextFormField(
              initialValue: widget.inputPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '비밀번호가 입력되지 않았습니다.';
                }

                if (value.length < 6) {
                  return '최소 6자리 이상이어야 합니다.';
                }
                return null;
              },
              onChanged: (value) => widget.updateInputPassword(value),
              obscureText: !widget.isPasswordVisible,
              decoration: InputDecoration(
                labelText: '비밀번호',
                hintText: '비밀번호를 입력하세요',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    // _emailController.clear();
                    // controller.toggleClearEmailVisible(false);
                  },
                  child: const Icon(
                    true ? Icons.highlight_remove : null,
                  ),
                ),
              ),
            ),
            _gap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CheckboxListTile(
                    value: widget.isPasswordVisible,
                    onChanged: (value) {
                      widget.setPasswordVisible(!widget.isPasswordVisible);
                    },
                    title: const Text('비밀번호 표시'),
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: CheckboxListTile(
                    value: widget.isAutoLogin,
                    onChanged: (value) {
                      if (value == null) return;
                      widget.setAutoLogin(!widget.isAutoLogin);
                    },
                    title: const Text('자동로그인'),
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
              ],
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '로그인',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  if (widget.inputEmail.isNotEmpty && widget.inputPassword.isNotEmpty) {
                    if (_formKey.currentState?.validate() ?? false) {
                      _login();
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}

//                            TODO:
///
///[1. All State value move to parent widget because of responsive ui] // ✅
///[2. After validation fail, hover color in light mode is invisible] // ✅
///[3. Clear for user input should be working]
//