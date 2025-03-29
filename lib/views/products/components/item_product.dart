
part of'products/view.dart';
class _Item extends StatefulWidget {
  final ProductModel model;

  const _Item({required this.model});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 4)
          ]),
      child: Column(
        children: [
          Image.network(widget.model.image,
              height: 140, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.model.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {
                         print("Hello");
                        widget.model.toggle();
                        setState(() {});
                      },
                      child: Icon(
                          widget.model.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_rounded,
                          color: widget.model.isFavorite ? Colors.green : null),
                    )
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  widget.model.description,
                  maxLines: 3,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff16A124)),
                ),
                Row(
                  children: [
                    Text(
                      "${widget.model.priceAfter} \$",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      " "
                          "${widget.model.priceBefore}\$",
                      style: const TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                // SizedBox(height: 6),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
