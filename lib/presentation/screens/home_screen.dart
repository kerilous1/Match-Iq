import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../widgets/match_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      //app bar
      appBar: AppBar(
        title: const Text('Match-Iq', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              //for search
            },
          ),
        ],
      ),
      //test cards
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: const [

          //test live match
          MatchCard(
            homeTeamName: "Real Madrid CF",
            homeTeamLogo: "https://assets.football-logos.cc/logos/spain/512x512/real-madrid.c97a476c.png",
            awayTeamName: "Barcelona FC",
            awayTeamLogo: "https://tse4.mm.bing.net/th/id/OIP.4eLwPDOhLiS4DWexutPB7AHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
            status: MatchStatus.live,
            matchTime: "75'",
            homeScore: 2,
            awayScore: 1,
            homeYellowCards: 1,
            awayRedCards: 1,
            isFavorite: true,// not yet
          ),

          //Not Started
          MatchCard(
            homeTeamName: "Al Ahly SC ",
            homeTeamLogo: "https://assets.football-logos.cc/logos/egypt/512x512/al-ahly.807381aa.png",
            awayTeamName: "Zamalek SC ",
            awayTeamLogo: "https://assets.football-logos.cc/logos/egypt/512x512/zamalek.4fde1095.png",
            status: MatchStatus.notStarted,
            matchTime: "19:00",
          ),

          //Finished match
          MatchCard(
            homeTeamName: "Liverpool FC ",
            homeTeamLogo: "https://assets.football-logos.cc/logos/england/512x512/liverpool.bc7f4063.png",
            awayTeamName: "Man City ",
            awayTeamLogo: "https://assets.football-logos.cc/logos/england/512x512/manchester-city.ef1fe757.png",
            status: MatchStatus.finished,
            matchTime: "FT",
            homeScore: 1,
            awayScore: 1,
            homeYellowCards: 2,
            awayYellowCards: 3,
            homeRedCards: 1,
          ),

        ],
      ),
    );
  }
}