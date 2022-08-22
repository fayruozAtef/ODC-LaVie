import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavei/layout/lavie_layout/cubit/states.dart';
import 'package:lavei/module/cart/cart_screen.dart';
import 'package:lavei/module/search/search_screen.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../layout/lavie_layout/cubit/cubit.dart';
import '../../shared/component/components.dart';
import '../../shared/style/colors.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit,LaVieStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            navigateTo(context, SearchScreen());
                          },
                          child: Container(
                            height: 46.0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: lightGrey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(Icons.search_outlined,color: textColor,),
                                ),
                                Text('Search',style:GoogleFonts.roboto(textStyle: TextStyle(color:textColor,fontSize: 16.0)),)
                              ],),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0,),
                      Container(
                        height: 46.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          onPressed: () {
                            navigateTo(context, CartScreen());
                          },
                          icon: const Image(
                            image: AssetImage(
                              'assets/images/cart.png',
                            ),
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  /*Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: categoryItem('All',(){}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:const  EdgeInsets.only(right: 5.0),
                          child: categoryItem('Plants',(){}),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: categoryItem('Seeds',(){}),
                        ),
                      ),
                      Expanded(child: categoryItem('Tools',(){})),

                    ],
                  ),*/
                  DefaultTabController(
                    length: 4,
                    initialIndex: LaVieCubit.get(context).currentCategoryIndex,
                    child: TabBar(
                        indicator:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0), // Creates border
                            //color: Colors.greenAccent
                          border: Border.all(color: lightGreen,width: 2.0)
                        )
                        ,
                        unselectedLabelColor: Colors.grey,
                        labelColor: lightGreen,
                        labelStyle: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18.0,)),
                        onTap: (index){
                          LaVieCubit.get(context).changeCurrentCategory(index);
                        },
                        tabs: const[
                          Tab(text: 'All',),
                          Tab( text: 'Plants',),
                          Tab( text: 'Seeds',),
                          Tab( text: 'Tools',),
                        ]
                    ),

                  ),
                  const SizedBox(height: 20.0,),
                  ConditionalBuilder(
                    condition: state is! GetAllProductLoadingState,
                    builder: (context)=>GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 3.0,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: 1/2,
                      children: List.generate(
                        LaVieCubit.get(context).products.length,
                            (index) => productItem(
                          data: LaVieCubit.get(context).products[index],
                          increaseFunction: () {
                            LaVieCubit.get(context).changeCountOfProduct(index, '+');
                          },
                          decreaseFunction: () {
                            LaVieCubit.get(context).changeCountOfProduct(index, '-');
                          },
                          addToCartFunction: () {  },
                          count: LaVieCubit.get(context).counts[index],
                        ),
                      ),
                    ),
                    fallback: (context)=>Center(child: CircularProgressIndicator(),),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget categoryItem(String title, VoidCallback onPressed){
    return Container(
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            '$title',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 16.0),color: lightGreen),
          ),
        ));
  }

  Widget pageContent(BuildContext context){
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 3.0,
      crossAxisSpacing: 5.0,
      childAspectRatio: 1/2,
      children: List.generate(
        LaVieCubit.get(context).products.length,
            (index) => productItem(
          data: LaVieCubit.get(context).products[index],
          increaseFunction: () {
            LaVieCubit.get(context).changeCountOfProduct(index, '+');
          },
          decreaseFunction: () {
            LaVieCubit.get(context).changeCountOfProduct(index, '-');
          },
          addToCartFunction: () {  },
          count: LaVieCubit.get(context).counts[index],
        ),
      ),
    );
  }
}
