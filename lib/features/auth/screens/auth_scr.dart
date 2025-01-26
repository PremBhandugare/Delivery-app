import "package:bigthing/common/widgets/button.dart";
import "package:bigthing/common/widgets/textfield.dart";
import "package:bigthing/features/auth/services/auth_service.dart";
import "package:flutter/material.dart";

class AuthScr extends StatefulWidget{
  static const String routeName = '/auth_screen';
  const AuthScr({super.key});

  @override
  State<AuthScr> createState() => _AuthScrState();
}

class _AuthScrState extends State<AuthScr> {
  bool _isSignUp = true ; 
  final _signupKey = GlobalKey<FormState>();
  final _signuinKey = GlobalKey<FormState>();

  final TextEditingController _emailContr = TextEditingController();
  final TextEditingController _passContr = TextEditingController();
  final TextEditingController _nameContr = TextEditingController();
  
  final AuthService authService = AuthService();
  void signupuser(){
    authService.signUp(
      context: context,
      email: _emailContr.text,
      password: _passContr.text,
      name: _nameContr.text,
    );
  }

  void signinuser(){
    authService.signIn(
      context: context, 
      email: _emailContr.text, 
      password: _passContr.text
    );
  }

 @override
  void dispose() {
    super.dispose();
    _emailContr.dispose();
    _passContr.dispose();
    _nameContr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 248, 230),
        body: SafeArea(
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    const Text(
                      'WELCOME',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    const SizedBox(height: 20,),
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                             vertical: 10,
                             horizontal: 20,
                            ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            Text(
                              _isSignUp
                              ?'Register'
                              :'Login',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(height: 20,),
                            _isSignUp
                            ?Form(
                              key: _signupKey,
                              child: Column(
                                children: [
                                  CustomTextField(controller:_nameContr,hinttext: 'Name',),
                                  const SizedBox(height: 10,),
                                  CustomTextField(controller:_emailContr,hinttext: 'Email',),
                                  const SizedBox(height: 10,),
                                  CustomTextField(controller:_passContr,hinttext: 'Password',),
                                  const SizedBox(height: 10,),
                                  CustomButton(
                                    text: 'Sign Up', 
                                    onTap:(){
                                      if (_signupKey.currentState!.validate()) {
                                        signupuser();
                                      }
                                    })
                                ],
                              ),
                            )
                            :Form(
                              key: _signuinKey,
                              child: Column(
                                children: [
                                  CustomTextField(controller:_emailContr,hinttext: 'Email',),
                                  const SizedBox(height: 10,),
                                  CustomTextField(controller:_passContr,hinttext: 'Password',),
                                  const SizedBox(height: 10,),
                                  CustomButton(
                                    text: 'Sign In', 
                                    onTap:(){
                                      if (_signuinKey.currentState!.validate()) {
                                        signinuser();
                                      }
                                    }
                                  )
                                ],
                              ),
                            ),

                            
                            const SizedBox(height: 10,),
                            TextButton(
                              onPressed: (){                     
                                  if (_isSignUp==true) {
                                    setState(() {
                                    _isSignUp = false ;
                                    });
                                  } else {
                                    setState(() {
                                    _isSignUp = true ;
                                    });
                                  }              
                              },
                              child: Text(
                              _isSignUp
                              ?'Already have an account ?'
                              :'Create an account',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.green
                              ),
                            ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),
      );
  }
}