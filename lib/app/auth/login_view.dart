import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rstore/app/main/main_view.dart';
import 'package:rstore/app/widgets/textformfield_primary.dart';
import 'package:rstore/values/colors.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  String _emailID = "",
      _password = "",
      _email = "mohrifkan00@gmail.com",
      _pass = "12345678";
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void validateLogin() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (_emailID == _email && _password == _pass) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainView()));
        print('Berhasil Login');
      } else {
        print('Gagal Login');
        print(_emailID);
        print(_password);
        final snackBar = SnackBar(
          content: Text('Email or password not register!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child:
                    Image.asset('assets/images/splash.png', fit: BoxFit.fill),
              ),
              AnimatedPositioned(
                  bottom: MediaQuery.of(context).size.height / 1.6,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.asset(
                        "assets/images/logofill.png",
                      ),
                    ),
                  ),
                  duration: Duration(milliseconds: 500)),
              AnimatedPositioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Text('Login',
                              style: GoogleFonts.fjallaOne(
                                color: accent,
                                fontSize: 30,
                              )),
                          SizedBox(height: 20),
                          TextfieldPrimary(
                              label: 'Email',
                              hint: 'Input Email',
                              onSave: (email) => _emailID = email!,
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next),
                          SizedBox(height: 15),
                          TextfieldPrimary(
                              label: 'Password',
                              hint: 'Input Password',
                              surfixicon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: _toggle,
                              ),
                              obscureText: _obscureText,
                              onSave: (password) => _password = password!,
                              inputType: TextInputType.visiblePassword,
                              inputAction: TextInputAction.done),
                          SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: validateLogin,
                              style: ElevatedButton.styleFrom(
                                primary: primary,
                                onPrimary: white,
                                shape: StadiumBorder(),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child: Text('Submit',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.fjallaOne(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1)),
                              )),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                  duration: Duration(milliseconds: 500)),
            ],
          ),
        ),
      ),
    );
  }
}
