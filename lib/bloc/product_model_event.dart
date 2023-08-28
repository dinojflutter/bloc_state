part of 'product_model_bloc.dart';

sealed class ProductModelEvent extends Equatable {
  const ProductModelEvent();

  @override
  List<Object> get props => [];
}

class ProductloadedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
