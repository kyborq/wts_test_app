enum AppPages {
  catalog,
  products,
}

extension AppPageExtension on AppPages {
  String get toPath {
    switch (this) {
      case AppPages.catalog:
        return '/';
      case AppPages.products:
        return '/products';
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.catalog:
        return 'Каталог';
      case AppPages.products:
        return 'Продукты';
    }
  }
}
