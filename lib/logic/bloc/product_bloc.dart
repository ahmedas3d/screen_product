import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/repository/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductLoading());

  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductLoadEvent) {
      yield ProductLoading();
      try {
        final products = await productRepository.fetchProducts();
        yield ProductLoaded(products);
      } catch (e) {
        yield ProductError('Failed to load products');
      }
    }
  }
}
