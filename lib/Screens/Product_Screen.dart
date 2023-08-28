import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_model_bloc.dart';

class ProductScreem extends StatefulWidget {
  const ProductScreem({super.key});

  @override
  State<ProductScreem> createState() => _ProductScreemState();
}

class _ProductScreemState extends State<ProductScreem> {
  @override
  void initState() {
    context.read<ProductModelBloc>().add(ProductloadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prodel Product"),
      ),
      body: BlocBuilder<ProductModelBloc, ProductModelState>(
          builder: (context, state) {
        if (State is Productloadingstate) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Productloadedstate) {
          return ListView.builder(
              itemCount: state.productsModel.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        color: Colors.white,
                        height: 200,
                        child: Row(
                          children: [
                            // Text(state.productsModel[index].category.toString()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Image.network(
                                state.productsModel[index].image.toString(),
                                height: 150,
                                width: 150,
                              ),
                            ),

                            Text(
                              state.productsModel[index].category.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
        } else if (state is ProductErrorstate) {
          return (Center(
            child: Text(state.errorMessage),
          ));
        }
        return const SizedBox();
      }),
    );
  }
}