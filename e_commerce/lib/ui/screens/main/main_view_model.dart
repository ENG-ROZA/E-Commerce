import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewModel extends Cubit {
  MainViewModel() : super(MainIntialState());
  int currentTabIndex = 0;

  void changeSelectedTab(int newIndex) {
    currentTabIndex = newIndex;
    emit(MainIntialState()); /// screen has been rebuild in cubit with emit function
  }                          /// MainInitialState object is created everytime when screen is rebuilded
}

class MainIntialState {}
