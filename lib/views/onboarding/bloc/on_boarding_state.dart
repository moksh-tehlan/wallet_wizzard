part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
  const OnBoardingState({
    required this.currentPage,
    required this.isLastPage,
    required this.maxPage,
    required this.pageController,
  });

  final int currentPage;
  final bool isLastPage;
  final int maxPage;
  final PageController pageController;

  OnBoardingState copyWith({
    int? currentPage,
    bool? isLastPage,
    int? maxPage,
    PageController? pageController,
  }) {
    return OnBoardingState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      maxPage: maxPage ?? this.maxPage,
      pageController: pageController ?? this.pageController,
    );
  }

  @override
  List<Object?> get props => [currentPage, isLastPage, maxPage, pageController];
}
