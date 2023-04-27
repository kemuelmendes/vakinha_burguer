import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/pages/home/widgets/home_state.dart';
import 'package:delivery_app/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(this._productsRepository)
      : super(
          const HomeState.initial(),
        );

  Future<void> loadProducts() async {
    emit(state.copyWith(
      status: HomeStateStatus.loading,
      errorMessage: '',
    ));
    try {
      final products = await _productsRepository.findAllProducts();

      emit(
        state.copyWith(
          status: HomeStateStatus.loaded,
          products: products,
          errorMessage: '',
        ),
      );
    } on Exception catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Error ao Buscar produtos'));
    }
  }
}
