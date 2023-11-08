import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginBox extends StatefulWidget {
  final Function(int) changeMainPageIndex;
  const LoginBox({super.key, required this.changeMainPageIndex});
  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              maxWidth: 400,),
          child: SimpleDialog(
            //rgb(215, 35, 35) red 
            //rgb(238, 238, 238) white
            //rgb(48, 56, 65) black
            //rgb(58, 71, 80) grey
            shape: Border.all(width: 2,color: Color.fromARGB(255, 58, 71, 80),),
            backgroundColor: Color.fromARGB(255, 48, 56, 65),
            title: const Text('Demo',style: TextStyle(
              color: Colors.white),),
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text('Log in',style: TextStyle(
                color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[0-9a-zA-Z@.]")),
                      LengthLimitingTextInputFormatter(50)
                    ],
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.mail,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(
                    obscureText: true,
                    inputFormatters: [LengthLimitingTextInputFormatter(29)],
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never)),
              ),SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    width: 0.0,
                  ),
                  ElevatedButton(
                    //Add Functionality
                    onPressed: () => {widget.changeMainPageIndex(1)},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(40),
                        backgroundColor: Color.fromARGB(255, 215, 35, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text("Sign Up!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  ElevatedButton(
                    //Add Functionality
                    onPressed: () => {Get.offNamed('/home_page')},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(40),
                        backgroundColor: const Color.fromARGB(255, 215, 35, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text("Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(
                    width: 0.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          )),
    );
  }
}
