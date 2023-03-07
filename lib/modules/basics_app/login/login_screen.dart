import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
var emailContoller = TextEditingController();
var passController = TextEditingController();
bool hide=true;

final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Login Screen',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultTextField(
                      controller: emailContoller,
                      label: 'Email',
                      prefix: Icons.email_rounded,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if(value==null || value.isEmpty){
                          return 'emil must not be empty';
                        }
                        return null;
                      } ,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
               defaultTextField(
                controller: passController,
                label: 'Password',

                prefix: Icons.lock,
                suffix: hide ? Icons.visibility_off :Icons.visibility,

                type: TextInputType.visiblePassword,
                isPassword: hide,
                 suffixPressed: () {
                  setState(() {
                    hide = !hide;
                  });

                 },
                validate: (value) {
                  if(value==null || value.isEmpty){
                    return 'password must not be empty';
                  }
                  return null;
                } ,
              ),
                  SizedBox(
                    height: 25.0,
                  ),
                 defaultButton(
                     text: 'login',

                     function: ()
                     {
                       if(_formKey.currentState!.validate()) {
                         print(emailContoller.text);
                         print(passController.text);
                       }
                       },

                 ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                      ),
                      TextButton(onPressed:() {} ,
                          child: Text(
                            'Register Now',
                          ),
                      )
                    ],
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
