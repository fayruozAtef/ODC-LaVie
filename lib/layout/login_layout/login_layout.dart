import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavei/module/login/login_cubit/login_cubit.dart';
import 'package:lavei/shared/style/colors.dart';

import '../../module/login/login_cubit/login_states.dart';

class LoginLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 180.0,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image(
                              image: AssetImage('assets/images/img_1.png'),
                              height: 160.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:120.0),
                        child: Center(
                          child: Column(
                            children: [
                              Center(
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Text(
                                      'La  Vie',
                                      style: GoogleFonts.meddon(
                                        textStyle: TextStyle(fontSize: 27.0,color: Colors.black),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.only(top: 14.0),
                                      child: SizedBox(
                                        width: 23.0,
                                        height: 15.04,
                                        child: Image(image: AssetImage('assets/images/img.png')),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15.0,),
                              DefaultTabController(
                                length: 2,
                                initialIndex: LoginCubit.get(context).currentIndex,
                                child: TabBar(
                                    unselectedLabelColor: Colors.grey,
                                    labelColor: defaultColor,
                                    labelStyle: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18.0,)),
                                    onTap: (index){
                                      LoginCubit.get(context).swapLoginAndSignUp(index);
                                    },
                                    tabs: const[
                                      Tab(text: 'Sign Up',),
                                      Tab( text: 'Login',),
                                    ]
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          child: LoginCubit.get(context).screens[LoginCubit.get(context).currentIndex],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children:const [
                        Image(
                          image: AssetImage('assets/images/img_2.png'),
                          width: 160.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
