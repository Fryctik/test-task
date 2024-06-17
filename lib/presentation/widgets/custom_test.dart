// import 'package:flutter/material.dart';
//
// class PlaylistScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SliverFab(
//         floatingWidget: FloatingActionButton(
//           backgroundColor: const Color(0xffD933C3),
//           onPressed: () {},
//           child: Icon(
//             Icons.play_arrow,
//             color: Colors.white,
//             size: 38,
//           ),
//         ),
//         floatingPosition: FloatingPosition(
//           right: 32,
//         ),
//         expandedHeight: MediaQuery.of(context).size.height * 0.4,
//         slivers: [
//           SliverAppBar(
//             expandedHeight: MediaQuery.of(context).size.height * 0.4,
//             backgroundColor: const Color(0xff1c0436),
//             pinned: true,
//             floating: true,
//             leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
//             actions: [
//               IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
//             ],
//             flexibleSpace: Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(
//                         'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4bb82b72535211.5bead62fe26d5.jpg'), //your image
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.vertical(
//                     bottom:
//                     Radius.circular(50),
//                   ),
//                 ),
//                 child: FlexibleSpaceBar(
//                     collapseMode: CollapseMode.pin,
//                     centerTitle: true,
//                     title: Text('A Synthwave Mix'))),
//           ),
//           SliverList(
//               delegate: SliverChildListDelegate([
//                 Column(
//                   children: [
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                     SongTile(),
//                   ],
//                 )
//               ]))
//         ],
//       ),
//     );
//   }
// }