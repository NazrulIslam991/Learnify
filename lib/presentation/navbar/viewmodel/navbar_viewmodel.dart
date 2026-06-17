import 'package:flutter_riverpod/legacy.dart';

class NavbarViewModel extends StateNotifier<int> {
  NavbarViewModel() : super(0);

  void setIndex(int index) {
    state = index;
  }
}

final navbarProvider = StateNotifierProvider<NavbarViewModel, int>((ref) {
  return NavbarViewModel();
});
