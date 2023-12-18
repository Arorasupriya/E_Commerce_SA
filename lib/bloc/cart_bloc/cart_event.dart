part of 'cart_bloc.dart';

abstract class CartEvent {}

class GetCartResponse extends CartEvent {
  Map<String, dynamic> bodyParameter;
  GetCartResponse({required this.bodyParameter});
}
