import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavei/module/login/login_cubit/login_cubit.dart';

import '../../shared/component/components.dart';
import '../login/login_cubit/login_states.dart';

class SignUpScreen extends StatelessWidget {

  var formKey= GlobalKey<FormState>();
  var firstNameController= TextEditingController();
  var lastNameController= TextEditingController();
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var passwordConfirmController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state){},
        builder: (context, state){
          return Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mySpace(),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'First Name',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                                  ),
                                ),
                                const SizedBox(height: 2.0,),
                                SizedBox(
                                  width: 155.0,
                                  child: defaultTextFormField(
                                    controler: firstNameController,
                                    input: TextInputType.name,
                                    validate: (value){
                                      if(value!.isEmpty){
                                        return 'Enter your first name';
                                      }
                                    },
                                    lable: '',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Last Name',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                                  ),
                                ),
                                const SizedBox(height: 2.0,),
                                SizedBox(
                                  width: 155.0,
                                  child: defaultTextFormField(
                                    controler: lastNameController,
                                    input: TextInputType.name,
                                    validate: (value){
                                      if(value!.isEmpty){
                                        return 'Enter your last name';
                                      }
                                    },
                                    lable: '',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        mySpace(),
                        Text(
                          'Email',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                          ),
                        ),
                        const SizedBox(height: 2.0,),
                        defaultTextFormField(
                          controler: emailController,
                          input: TextInputType.emailAddress,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'Enter your email';
                            }
                          },
                          lable: '',
                        ),
                        mySpace(),
                        Text(
                          'Password',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                          ),
                        ),
                        const SizedBox(height: 2.0,),
                        defaultTextFormField(
                          controler: passwordController,
                          input: TextInputType.text,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'Enter your password';
                            }
                          },
                          lable: '',
                        ),
                        mySpace(),
                        Text(
                          'Confirm Password',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                          ),
                        ),
                        const SizedBox(height: 2.0,),
                        defaultTextFormField(
                          controler: passwordConfirmController,
                          input: TextInputType.text,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'Confirm your password';
                            }
                            if(value !=passwordController.text){
                              return "this password doesn't match the above one";
                            }
                          },
                          lable: '',
                        ),
                        mySpace(),
                        ConditionalBuilder(
                            condition: state is! CreateUserWithEmailAndPasswordLoadingState,
                            builder: (context)=>defaultButton(
                                function: (){
                                  if(formKey.currentState!.validate()){
                                    LoginCubit.get(context)
                                        .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text);
                                  }
                                },
                                text: 'Login'),
                            fallback: (context)=>Center(child: CircularProgressIndicator()))

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
