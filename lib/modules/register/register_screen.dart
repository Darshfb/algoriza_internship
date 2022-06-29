import 'package:algoriza_internship/modules/login/login_screen.dart';
import 'package:algoriza_internship/shared/component/default_button.dart';
import 'package:algoriza_internship/shared/component/default_text_button.dart';
import 'package:algoriza_internship/shared/component/navigate_to.dart';
import 'package:algoriza_internship/shared/component/phone_form_field.dart';
import 'package:algoriza_internship/shared/component/text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Center(
                    child: Image(
                      image: const AssetImage('assets/images/login-header.jpg'),
                      height: MediaQuery.of(context).size.height / 6,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 18,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Welcome to fashion daily',
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Register',
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
                      height: 10.0,
                    ),
                    Text('Email', style: Theme.of(context).textTheme.caption),
                    const SizedBox(height: 5.0,),
                    DefaultTextFormField(
                        keyboard: TextInputType.text,
                        controller: emailController,
                    hintText: 'Eg. example@gmail.com',
                      pressedSuffixIcon: (){
                          setState((){});
                      },
                      validator: (value){
                          if(value!.isEmpty){
                            return 'Your Email mustn\'t be empty';
                          }
                      },
                    ),
                    const SizedBox(height: 10.0,),
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
                      onSubmitted: (value) {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(height: 8.0,),
                    const Text('Password'),
                    const SizedBox(height: 5.0,),
                    DefaultTextFormField(
                      keyboard: TextInputType.visiblePassword,
                      controller: passwordController,
                      hintText: 'Eg. example@gmail.com',
                      obscureText: obscureText,
                      suffixIcon: obscureText ? Icons.visibility : Icons.visibility_off_outlined,
                      pressedSuffixIcon: (){
                        setState((){
                          obscureText = ! obscureText;
                        });
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Your Email mustn\'t be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    DefaultButton(
                      text: 'Register',
                      height: 40,
                      backgroundColor: Colors.blue,
                      width: double.infinity,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Or',
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        )),
                    OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/google.svg',
                            height: 20.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'Sign with by google',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Has any account?'),
                        DefaultTextButton(
                          text: 'Sign in here',
                          onPressed: () {
                            navigateTo(
                                context: context, widget: LoginScreen());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            'By regestering your account, you are agree to our ',
                            style: Theme.of(context).textTheme.caption,
                            textAlign: TextAlign.center,
                          ),
                          DefaultTextButton(text: 'terms and condtions', onPressed: (){})
                        ],
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
