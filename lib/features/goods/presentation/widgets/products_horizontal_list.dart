import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:market_test_project/core/widgets/app_horizontal_list.dart';
import 'package:market_test_project/features/goods/domain/entities/product_entity.dart';
import 'package:market_test_project/features/goods/presentation/bloc/products_cubit.dart';
import 'package:market_test_project/features/goods/presentation/bloc/products_state.dart';
import 'package:market_test_project/features/goods/presentation/widgets/product_card_widget.dart';

class ProductsHorizontalList extends StatefulWidget {
  const ProductsHorizontalList({super.key});

  @override
  State<ProductsHorizontalList> createState() => _ProductsHorizontalListState();
}

class _ProductsHorizontalListState extends State<ProductsHorizontalList> {
  final ProductsCubit _productsCubit = GetIt.I<ProductsCubit>();

  @override
  void initState() {
    _productsCubit.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _productsCubit,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductsLoaded) {
          return AppHorizontalList<ProductEntity>(
            items: state.products,
            itemBuilder: (context, item, index) =>
                ProductCardWidget(product: item),
          );
        }
        return SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
