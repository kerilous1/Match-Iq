import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_styles.dart';

//
enum MatchStatus { notStarted, live, finished }

class MatchCard extends StatelessWidget {
  //home team
  final String homeTeamName;
  final String homeTeamLogo;
  final int homeScore;
  final int homeRedCards;
  final int homeYellowCards;
  //away team
  final String awayTeamName;
  final String awayTeamLogo;
  final int awayScore;
  final int awayRedCards;
  final int awayYellowCards;
  //general data
  final MatchStatus status; //match status from enums
  final String matchTime;
  //favouretes user
  final bool isFavorite;
  final bool isNotificationOn; //notification on or off

  const MatchCard({
    super.key,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.status,
    required this.matchTime,
    this.homeScore = 0, //from her defolt value
    this.awayScore = 0,
    this.homeRedCards = 0,
    this.homeYellowCards = 0,
    this.awayRedCards = 0,
    this.awayYellowCards = 0,
    this.isFavorite = false,
    this.isNotificationOn = false,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 10, //blur of shadow
            offset: Offset(0, 4), //direction of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //home team
            Expanded(
              child: _buildTeamSide(
                teamName: homeTeamName,
                teamLogo: homeTeamLogo,
                redCards: homeRedCards,
                yellowCards: homeYellowCards,
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _buildMiddleSection(),
            ),
            //away team
            Expanded(
              child: _buildTeamSide(
                teamName: awayTeamName,
                teamLogo: awayTeamLogo,
                redCards: awayRedCards,
                yellowCards: awayYellowCards,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamSide({
    required String teamName,
    required String teamLogo,
    required int redCards,
    required int yellowCards,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //team logo
        Image.network(
          teamLogo,
          height: 45,
          width: 45,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.sports_soccer, size: 45, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        //team name
        Text(
          teamName,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (status != MatchStatus.notStarted &&
            (redCards > 0 || yellowCards > 0)) ...[
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (redCards > 0) ...[
                _buildCardIcon(Colors.red, redCards),
                const SizedBox(width: 4),
              ],
              if (yellowCards > 0) ...[
                _buildCardIcon(Colors.yellow, yellowCards),
                const SizedBox(width: 4),
              ],
            ],
          ),
        ],
      ],
    );
  }

  _buildCardIcon(Color color, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        count.toString(),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget? _buildMiddleSection() {
    if (status == MatchStatus.notStarted) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Starts in", style: AppTextStyles.timeRemaining),
          const SizedBox(height: 4),
          Text(
            matchTime,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$homeScore - $awayScore",
            style: status == MatchStatus.live
                ? AppTextStyles.liveScore
                : AppTextStyles.score,
          ),
          const SizedBox(height: 4),
          Text(
            status == MatchStatus.live ? "LIVE" : "FT",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: status == MatchStatus.live
                  ? AppColors.liveMatch
                  : AppColors.textSecondary,
            ),
          ),
        ],
      );
    }
  }
}
