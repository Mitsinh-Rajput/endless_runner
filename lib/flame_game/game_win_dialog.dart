import 'package:endless_runner/flame_game/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:provider/provider.dart';

import '../level_selection/levels.dart';
import '../style/palette.dart';

/// This dialog is shown when a level is completed.
///
/// It shows what time the level was completed in and if there are more levels
/// it lets the user go to the next level, or otherwise back to the level
/// selection screen.
class GameWinDialog extends StatelessWidget {
   GameWinDialog({
    super.key,
    required this.level,
    required this.levelCompletedIn,
  });

  /// The properties of the level that was just finished.
  final GameLevel level;

  /// How many seconds that the level was completed in.
  final int levelCompletedIn;

  final scoreNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final palette = context.read<Palette>();
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: palette.backgroundPlaySession.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game Over!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Your happiness score is 0 in $levelCompletedIn seconds.',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  GameScreen(level: gameLevels.first)),);
            }, child: Text("Restart"))
          ],
        ),
      ),
    );
  }
}
