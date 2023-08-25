import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wts_test_app/models/catalog_model.dart';
import 'package:wts_test_app/services/api_client.dart';

part 'catalog_state.dart';
part 'catalog_event.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({required this.apiClient}) : super(CatalogEmpty()) {
    on<FetchCatalog>(_onFetchCatalog);
  }

  final ApiClient apiClient;

  Future<FutureOr<void>> _onFetchCatalog(
    FetchCatalog event,
    Emitter<CatalogState> emit,
  ) async {
    emit(CatalogLoading());
    try {
      final categories = await apiClient.getCategories();
      emit(CatalogLoaded(categories));
    } on Exception {
      emit(CatalogError());
    }
  }
}
