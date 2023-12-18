part of 'cart_bloc.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  AddToCartModel addToCartModel;
  CartLoadedState({required this.addToCartModel});
}

class CartListLoadedState extends CartState {}

class CartErrorState extends CartState {
  String msgError;
  CartErrorState({required this.msgError});
}
