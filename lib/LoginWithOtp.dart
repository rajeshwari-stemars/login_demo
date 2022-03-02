import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

class LoginWithOtp extends StatefulWidget {
  const LoginWithOtp({Key? key}) : super(key: key);

  @override
  _LoginWithOtpState createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithOtp> {
  final otpController = TextEditingController();

  Future otpVerification() async {
    if (otpController.text.isEmpty) {
      //   Fluttertoast.showToast(msg: "Please Enter OTP");
    } else {
      //  EasyLoading.show();
    }
  }

  Future resendOtp() async {}

  final interval = const Duration(seconds: 1);
  Timer? timer;

  final int timerMaxSeconds = 15;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  String? get _errorText {
    final text = otpController.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'otp not valid';
    }
    if (text != "1234") {
      return "wrong otp";
    }
    // return null if the text is valid
    return null;
  }

  void _submit() {
    if (_errorText == null) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginWithOtp()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
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
              Text("OTP",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(
                height: height * 0.01,
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
                  height: height * 0.04,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: otpController,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Please Enter OTP",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                currentSeconds == 15
                    ? InkWell(
                        onTap: () {
                          resendOtp();
                        },
                        child: new Text("Resend OTP",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xffffffff),
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      )
                    : new Text("You can resend otp in $timerText sec",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                SizedBox(
                  height: height * 0.10,
                ),
                InkWell(
                  onTap: otpController.value.text.isNotEmpty ? _submit : null,
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
                        child: new Text("Submit OTP",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xffffffff),
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      )),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
