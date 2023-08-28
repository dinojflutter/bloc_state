import 'package:bloc/bloc.dart';
import 'package:block_app1/Models/Product_Model.dart';
import 'package:block_app1/repo/Products_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_model_event.dart';
part 'product_model_state.dart';

class ProductModelBloc extends Bloc<ProductloadedEvent, ProductModelState> {
  final ProductRepo productRepo;
  ProductModelBloc(this.productRepo) : super(Productloadingstate()) {
    on<ProductloadedEvent>((event, emit) async {
      try {
        emit(Productloadingstate());
        var data = await productRepo.getproduct();
        emit(Productloadedstate(data));
      } catch (e) {
        ProductErrorstate(e.toString());
      }
    });
  }
}
