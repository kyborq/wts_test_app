import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wts_test_app/models/products_model.dart';
import 'package:wts_test_app/services/api_client.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.apiClient}) : super(ProductsEmpty()) {
    on<FetchProducts>(_onFetchCatalog);
  }

  final ApiClient apiClient;

  Future<FutureOr<void>> _onFetchCatalog(
    FetchProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await apiClient.getProducts(event.catalogId);
      emit(ProductsLoaded(products));
    } on Exception {
      emit(ProductsError());
    }
  }
}
