import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/products/presention/views/widgets/ratingTile.dart';
import '../../manager/productsCubit.dart';
import '../../manager/prodcutsState.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  final ExpansionTileController expansionTileController = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFC7164F), width: 1.5),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: ExpansionTile(
                controller: expansionTileController,
                initiallyExpanded: cubit.isFilterExpanded,
                onExpansionChanged: (val) {
                  cubit.toggleFilterExpansion(val);
                },
                tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                iconColor: const Color(0xFFC7164F),
                collapsedIconColor: const Color(0xFFC7164F),
                title: Text(
                  "Filter by Rating (≥ ${cubit.selectedRating})",
                  style: const TextStyle(
                    color: Color(0xFFC7164F),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                children: List.generate(
                  5,
                      (index) => RatingTile(rating: index + 1,onTap: (){
                        cubit.filterByRating(index + 1);
                        expansionTileController.collapse();
                      },),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}