part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  @override
  List<Object> get props => [];
}

class CatalogEmpty extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  CatalogLoaded(this.categories);
  final List<Catalog> categories;

  @override
  List<Object> get props => [categories];
}

class CatalogError extends CatalogState {}
