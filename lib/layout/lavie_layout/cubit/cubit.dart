import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavei/layout/lavie_layout/cubit/states.dart';
import 'package:lavei/module/home/home_screen.dart';
import 'package:lavei/module/notification/notification_screen.dart';
import 'package:lavei/module/plants/plants_screen.dart';
import 'package:lavei/module/profile/profile_screen.dart';
import 'package:lavei/shared/component/constants.dart';
import 'package:lavei/shared/network/local/cach_helper.dart';
import 'package:lavei/shared/network/remote/dio_helper.dart';
import 'package:lavei/shared/network/remote/end_points.dart';
import '../../../model/product_model/Data.dart';
import '../../../model/product_model/Plant.dart';
import '../../../module/scan_qr_code/scan_qr_code_screen.dart';

class LaVieCubit extends Cubit<LaVieStates>{

  LaVieCubit():super(LaVieInitialStates());

  static LaVieCubit get(context)=>BlocProvider.of(context);

  int currentBottomNavBarIndex=-1;

  List<Widget>screens=[
    HomeScreen(),
    PlantsScreen(),
    ScanQrCodeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void changeBottomNav(int index){
    currentBottomNavBarIndex=index;
    emit(ChangeBottomNavBarState());
  }

  int currentCategoryIndex=0;

  void changeCurrentCategory(int index){
    currentCategoryIndex=index;
    emit(ChangeCurrentCategoryState());
    if(index==0) {
      getAllProducts(GET_ALL_PRODUCT);
    }
    else if(index == 1){
      getAllProducts(GET_ALL_PLANTS);
    }
    else if(index == 2){
      getAllProducts(GET_ALL_SEEDS);
    }
    else if(index == 3){
      getAllProducts(GET_ALL_TOOLS);
    }
  }

  List<Data> products=[];
  List<int> counts=[];
  //AllProducts? allProducts;
  void getAllProducts(String url){
    products=[];
    counts=[];
    emit(GetAllProductLoadingState());
    DioHelper.getData(
        url: url,
        token: CURRENT_TOKEN ?? "")
        .then((value) {
          //allProducts=AllProducts.fromJson(value.data);
          for (var element in value.data['data']) {
            products.add(Data.fromJson(element));
            counts.add(1);
      }
      emit(GetAllProductSuccessState());
    })
        .catchError((error) {
          print('Error --> '+error.toString());
          emit(GetAllProductErrorState());
    });
  }

  void changeCountOfProduct(int index,String operation){
    switch( operation ) {
      case '+': counts[index]++; break;
      case '-': counts[index]--; break;
    }
    emit(ChangeCountOfProductState());

  }

}