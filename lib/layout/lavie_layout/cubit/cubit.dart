import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavei/layout/lavie_layout/cubit/states.dart';

class LaVieCubit extends Cubit<LaVieStates>{

  LaVieCubit():super(LaVieInitialStates());

  static LaVieCubit get(context)=>BlocProvider.of(context);

  int currentBottomNavBarIndex=0;

  void changeBottomNav(int index){
    currentBottomNavBarIndex=index;
    emit(ChangeBottomNavBarState());
  }
}