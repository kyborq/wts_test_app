part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsEmpty extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  ProductsLoaded(this.products);
  final List<Product> products;

  @override
  List<Object> get props => [products];
}

class ProductsError extends ProductsState {}
