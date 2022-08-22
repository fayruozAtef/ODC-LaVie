import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavei/layout/lavie_layout/cubit/cubit.dart';
import 'package:lavei/shared/network/remote/end_points.dart';
import '../../shared/style/colors.dart';
import 'cubit/states.dart';

class LavieLayoutScreen extends StatelessWidget {

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>LaVieCubit()..getAllProducts(GET_ALL_PRODUCT),
      child: BlocConsumer<LaVieCubit,LaVieStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit =LaVieCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentBottomNavBarIndex+1],
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                LaVieCubit.get(context).changeBottomNav(-1);
              },
              backgroundColor: lightGreen,
              child: ImageIcon(AssetImage('assets/images/home.png'),),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 20.0,
              clipBehavior: Clip.antiAlias,
              child: Container(
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width/2 -40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: ImageIcon(AssetImage('assets/images/leaf.png')),
                            onPressed: (){LaVieCubit.get(context).changeBottomNav(0);},
                          ),
                          IconButton(
                            icon: ImageIcon(AssetImage('assets/images/qr-code-scan.png')),
                            onPressed: (){LaVieCubit.get(context).changeBottomNav(1);},
                          ),

                        ],
                      ),
                    ),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width/2 -40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: ImageIcon(AssetImage('assets/images/bell.png')),
                            onPressed: (){LaVieCubit.get(context).changeBottomNav(2);},
                          ),
                          IconButton(
                            icon: ImageIcon(AssetImage('assets/images/user.png')),
                            onPressed: (){LaVieCubit.get(context).changeBottomNav(3);},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



