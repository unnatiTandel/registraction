import 'package:flutter/material.dart';
import 'package:myproject/screens/LoginScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phnno = TextEditingController();
  TextEditingController psw = TextEditingController();

  void submit() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    name.clear();
    email.clear();
    phnno.clear();
    psw.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Register",
                  style: TextStyle(
                      // fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      fontFamily: 'OpenSans',
                      color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Create your account here",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.black54),
                ),
              ),
              UserInfo(
                name: name,
                email: email,
                phnno: phnno,
                psw: psw,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "OTP will be sent on this number",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.normal,
                        color: Colors.black54),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                      width: 350,
                      alignment: Alignment.center,
                      color: Colors.orange[800],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: FlatButton(
                          onPressed: submit,
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Register as a tutor",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.deepOrangeAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                      alignment: Alignment.center,
                      width: 350,
                      color: Colors.black87,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: FlatButton(
                          onPressed: submit,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
    @required this.name,
    this.email,
    this.phnno,
    this.psw,
  }) : super(key: key);

  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phnno;
  final TextEditingController psw;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 350,
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: name,
                  cursorColor: Colors.grey,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your name",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: 'OpenSans',
                      )),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 350,
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Email is Required";
                    }

                    if (!RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                      return 'Please enter a valid email Address';
                    }
                    return null;
                  },
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your email",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: 'OpenSans',
                      )),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 350,
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: psw,

                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password atleast 6 characters requied";
                    }
                    return null;
                  },
                  obscureText: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: 'OpenSans',
                      )),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 350,
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: phnno,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Phono number is Required";
                    }
                    if (value.length != 10) {
                      return "please provide Valid phone number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your contact number",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: 'OpenSans',
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
