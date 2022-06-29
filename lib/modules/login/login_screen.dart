import 'package:algoriza_internship/modules/register/register_screen.dart';
import 'package:algoriza_internship/shared/component/default_button.dart';
import 'package:algoriza_internship/shared/component/default_text_button.dart';
import 'package:algoriza_internship/shared/component/navigate_to.dart';
import 'package:algoriza_internship/shared/component/phone_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image(
                image: const AssetImage('assets/images/login-header.jpg'),
                height: MediaQuery.of(context).size.height / 3,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to fashion daily',
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: const [
                              Text(
                                'Help',
                                style: TextStyle(color: Colors.blue),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                radius: 8,
                                child: Icon(Icons.question_mark, size: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text('Phone Number'),
                    const SizedBox(
                      height: 8.0,
                    ),
                    PhoneFormField(
                      controller: phoneController,
                      keyboard: TextInputType.phone,
                      initialCountry: 'EG',
                      hintText: 'Eg 812345678',
                      onChanged: (phone) {
                        if (kDebugMode) {
                          print(phone.completeNumber);
                        }
                      },
                      onSubmitted: (value){
                        if(_formKey.currentState!.validate()){

                        }
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    DefaultButton(
                      text: 'Sign In',
                      height: 40,
                      backgroundColor: Colors.blue,
                      width: double.infinity,
                      textColor: Colors.white,
                      onPressed: (){
                        if(_formKey.currentState!.validate()){

                        }
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: Text('Or', style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,)),
                    OutlinedButton(
                      onPressed: (){},
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/google.svg', height: 20.0,),
                        const SizedBox(width: 10.0,),
                        const Text('Sign with by google', style: TextStyle(fontSize: 14.0),),
                      ],
                    ),),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Doesn\'t has any account?'),
                        DefaultTextButton(text: 'Register here',
                          onPressed: (){
                          navigateTo(context: context, widget: RegisterScreen());
                          },),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          'Use the application according to policy rules. Any kinds of of violations will be subject to sanctions',
                      style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.center,
                      ),
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
}
