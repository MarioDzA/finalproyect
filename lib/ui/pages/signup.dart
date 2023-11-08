import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateBox extends StatefulWidget {
  final Function(int) changeMainPageIndex;
  const CreateBox({super.key, required this.changeMainPageIndex});
  @override
  State<CreateBox> createState() => _CreateBoxState();
}

class _CreateBoxState extends State<CreateBox> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 450,
      ),
      child: SimpleDialog(
          shape: Border.all(
            width: 1,
            //rgb(238, 238, 238)
            //rgb(48, 56, 65)
            //rgb(58, 71, 80)
            color: Color.fromARGB(255, 58, 71, 80),),
          backgroundColor: Color.fromARGB(255, 48, 56, 65).withOpacity(0.7),
          title: const Text('Uninorte Help',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),),
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
              child: Text('Create account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(
              height: 10.0,
            ),
            // NAME
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person,
                          color: Color.fromARGB(255, 0, 0, 0)),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontStyle: FontStyle.normal,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never)),
            ),
            // EMAIL
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z@.]"))
                  ],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.mail,
                          color: Color.fromARGB(255, 0, 0, 0)),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontStyle: FontStyle.normal,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never)),
            ),
            // PASSWORD
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                  obscureText: true,
                  inputFormatters: [LengthLimitingTextInputFormatter(30)],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock,
                          color: Color.fromARGB(255, 0, 0, 0)),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontStyle: FontStyle.normal,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never)),
            ),
            // TEXTO DE LOGIN
            Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 0, 20),
                child: GestureDetector(
                    onTap: () {
                      widget.changeMainPageIndex(0);
                    },
                    child: const Text('Already registered? Go back to Log In',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontStyle: FontStyle.normal,
                        )))),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    width: 0.0,
                  ),
                  // BOTÓN SIGN UP
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(40),
                        //rgb(215, 35, 35)
                        backgroundColor: Color.fromARGB(255, 215, 35, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text("Create!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  const SizedBox(
                    width: 0.0,
                  ),
                ]),
            const SizedBox(
              height: 5.0,
            ),
          ]),
    ));
  }
}
