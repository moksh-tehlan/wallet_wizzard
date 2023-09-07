import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit()
      : super(
          OnBoardingState(
            currentPage: 0,
            isLastPage: false,
            maxPage: 0,
            pageController: PageController(),
          ),
        );

  void set(int maxPage) {
    emit(state.copyWith(maxPage: maxPage));
  }

  void navigateToPage(int pageIndex) {
    if(pageIndex == state.maxPage-1) {
      emit(state.copyWith(currentPage:pageIndex,isLastPage: true));
    }
    else {
      emit(state.copyWith(currentPage: pageIndex, isLastPage: false));
    }
  }
}
