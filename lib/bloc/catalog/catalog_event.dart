part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCatalog extends CatalogEvent {
  FetchCatalog({this.parentId});
  final String? parentId;
}
