import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:themar/views/products/components/products/cubit.dart';

part '../item_product.dart';

part 'loading.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  final cubit = GetIt.I<ProductsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is GetProductsFailedState) {
          return const Text("Failed");
        } else if (state is GetProductsSuccessState) {
          return GridView.builder(
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 20,
                  childAspectRatio: 189 / 300),
              itemBuilder: (context, index) => _Item(model: state.list[index]));
        } else {
          return const _Loading();
        }
      },
    );
  }
}

// class _Item extends StatefulWidget {
//   final ProductModel model;
//
//   const _Item({required this.model});
//
//   @override
//   State<_Item> createState() => _ItemState();
// }
//
// class _ItemState extends State<_Item> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.25),
//                 offset: const Offset(0, 4),
//                 blurRadius: 4)
//           ]),
//       child: Column(
//         children: [
//           Image.network(widget.model.image,
//               height: 140, width: double.infinity, fit: BoxFit.cover),
//           SizedBox(height: 6),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 6),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(widget.model.title,
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w700)),
//                     GestureDetector(
//                       onTap: () {
//                         widget.model.toggle();
//                         setState((){});
//                       },
//                       child: Icon(
//                         widget.model.isFavorite
//                             ? Icons.favorite
//                             : Icons.favorite_outline_rounded,
//                         color: widget.model.isFavorite ? Colors.green : null,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 6),
//                 Text(
//                   widget.model.description,
//                   maxLines: 2,
//                   style: TextStyle(
//                       fontSize: 10, color: Colors.black.withOpacity(0.37)),
//                 ),
//                 Row(children: [
//                   Text("${widget.model.priceAfter}\$",
//                       style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
//                   SizedBox(width: 8),
//                   Text("${widget.model.priceBefore}\$",
//                       style: TextStyle(
//                           fontSize: 14,
//                           decoration: TextDecoration.lineThrough,
//                           color: Colors.black.withOpacity(0.27),
//                           fontWeight: FontWeight.w700))
//                 ]),
//                 Align(
//                   alignment: AlignmentDirectional.centerEnd,
//                   child: CircleAvatar(
//                       radius: 15,
//                       child: Icon(Icons.shopping_cart,
//                           color: Colors.white, size: 16),
//                       // child: Icon(
//                       //   model.isFavorite
//                       //       ? Icons.favorite
//                       //       : Icons.favorite_outline_rounded,
//                       //   color: model.isFavorite ? Colors.green : null,
//                       // ),
//                       backgroundColor: Colors.green),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
