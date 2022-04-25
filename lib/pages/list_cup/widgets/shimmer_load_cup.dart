import 'package:flutter/material.dart';
import 'package:o_spawn_cup/pages/list_cup/widgets/row_tournament_state.dart';
import 'package:o_spawn_cup/pages/list_cup/widgets/tile_load_cup.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadCup extends StatelessWidget {
  const ShimmerLoadCup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          const RowTournamentState(),
          Flexible(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(8, (index) => const TileLoadCup()),
            ),
          ),
        ],
      ),
    );
  }
}
