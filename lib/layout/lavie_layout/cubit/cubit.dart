import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavei/layout/lavie_layout/cubit/states.dart';
import 'package:lavei/shared/component/constants.dart';
import 'package:lavei/shared/network/remote/dio_helper.dart';
import 'package:lavei/shared/network/remote/end_points.dart';
import '../../../model/product_model/ProductModel.dart';

class LaVieCubit extends Cubit<LaVieStates>{

  LaVieCubit():super(LaVieInitialStates());

  static LaVieCubit get(context)=>BlocProvider.of(context);

  int currentBottomNavBarIndex=-1;

  void changeBottomNav(int index){
    currentBottomNavBarIndex=index;
    emit(ChangeBottomNavBarState());
  }

  List<ProductModel> allProducts=[];
  void getAllProducts(){
    emit(GetAllProductLoadingState());
    DioHelper.getData(
        url: GET_ALL_PRODUCT,
        token: CURRENT_TOKEN ?? "")
        .then((value) {
          allProducts.add(ProductModel.fromJson(value.data));
          //print('array length --> ${allProducts.length}');
      emit(GetAllProductSuccessState());
    })
        .catchError((error) {
          print('Error --> '+error.toString());
          emit(GetAllProductErrorState());
    });
  }
}