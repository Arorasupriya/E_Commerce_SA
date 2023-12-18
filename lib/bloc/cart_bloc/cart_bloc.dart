import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/api_helper/api_exceptiion_handler.dart';
import 'package:e_commerce_app/api_helper/api_helper.dart';
import 'package:e_commerce_app/api_helper/app_variables.dart';
import 'package:e_commerce_app/models/detail_screens_model/add_cart%20_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<GetCartResponse>((event, emit) async {
      emit(CartLoadingState());
      Map<String, String> param = {
        "Authorization": "Bearer ${AppVariables.USER_TOKEN}"
      };
      try {
        var resData = await ApiHelper.postApiWithParameterAuth(
            strURL: AppVariables.cartAddURL,
            body: event.bodyParameter,
            mHeader: param);
        emit(CartLoadedState(addToCartModel: AddToCartModel.fromJson(resData)));
      } catch (e) {
        print("======>E$e");
        emit(CartErrorState(msgError: (e as MyException).ToString()));
      }
    });
  }
}
