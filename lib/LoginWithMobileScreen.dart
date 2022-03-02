import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_demo/LoginWithOtp.dart';

class LoginWithMobileScreen extends StatefulWidget {
  const LoginWithMobileScreen({Key? key}) : super(key: key);

  @override
  _LoginWithMobileScreenState createState() => _LoginWithMobileScreenState();
}

class _LoginWithMobileScreenState extends State<LoginWithMobileScreen> {
  final mobileController = TextEditingController();
  String? countryCode;

  Future userSignWithNumber() async {
    if (mobileController.text.isEmpty) {
      //  Fluttertoast.showToast(msg: "Please Enter Your Mobile Number");
    } else if (mobileController.text.length < 10) {
      //  Fluttertoast.showToast(msg: "Please Enter a valid Mobile Number");
    } else {}
  }

  String? get _errorText {
    final text = mobileController.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    if (text != "7975915538") {
      return "wrong number";
    }
    // return null if the text is valid
    return null;
  }

  void _submit() {
    if (_errorText == null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginWithOtp()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: ListView(children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Text("LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: height < 600 ? height * 0.70 : height * 0.68,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                new Text("Enter Mobile Number",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xffffffff),
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  controller: mobileController,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Mobile",
                    labelText: "Mobile",
                    errorText: _errorText,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                InkWell(
                  onTap:
                      mobileController.value.text.isNotEmpty ? _submit : null,
                  child: Container(
                      width: width * 0.4,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [Color(0xffff7b01), Color(0xffFC9700)],
                            stops: [0, 5],
                            begin: Alignment(-1.00, 0.00),
                            end: Alignment(1.00, -0.00),
                            // angle: 0,
                            // scale: undefined,
                          )),
                      child: Center(
                        child: new Text("Send OTP",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xffffffff),
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      )),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
