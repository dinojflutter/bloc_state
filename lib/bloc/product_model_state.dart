part of 'product_model_bloc.dart';

sealed class ProductModelState extends Equatable {
  const ProductModelState();

  @override
  List<Object> get props => [];
}

final class ProductModelInitial extends ProductModelState {}

final class Productloadingstate extends ProductModelState {}

final class Productloadedstate extends ProductModelState {
  final List<ProductModel> productsModel;

  const Productloadedstate(this.productsModel);
  @override
  List<Object> get props => [productsModel];
}

final class ProductErrorstate extends ProductModelState {
  final String errorMessage;

  const ProductErrorstate(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
