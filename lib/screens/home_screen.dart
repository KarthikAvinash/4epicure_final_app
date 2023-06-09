// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:miniplayer/miniplayer.dart';
// import '../models/playlist_model.dart';
// import '../models/video_model.dart';
// import '../screens/nav_screen.dart';
// import '../services/api_services.dart';
// import '../widgets/custom_sliver_app_bar.dart';
// import '../widgets/video_list.dart';
// import '../screens/video_screen.dart';
// import '../widgets/video_player.dart';
// import '../globals.dart';

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   final ScrollController _scrollController = ScrollController();
//   String _searchText = "";
//   bool _isLoadingMoreVideos = false;

//   @override
//   void dispose() {
//     super.dispose();
//     _scrollController.dispose();
//   }

//   void _loadMoreVideos() async {
//     setState(() {
//       _isLoadingMoreVideos = true;
//     });
//     await ref.read(currentPlaylistProvider.notifier).loadMoreVideos(
//           query: _searchText,
//           fetchType:
//               _searchText.isEmpty ? FetchType.trending : FetchType.search,
//         );
//     setState(() {
//       _isLoadingMoreVideos = false;
//     });
//   }

//   Future<void> _searchVideos() async {
//     await ref.read(currentPlaylistProvider.notifier).searchVideos(_searchText);
//   }

//   void _onSearchCleared() async {
//     _resetPlaylist();

//     setState(() {
//       _searchText = "";
//     });
//   }

//   void _onSearch(String searchText) async {
//     yt_vid_ctrl = false;
//     setState(() {
//       _searchText = searchText;
//     });

//     await _searchVideos();
//   }

//   void _resetPlaylist() {
//     ref.invalidate(currentPlaylistProvider);
//     _scrollController.jumpTo(0);
//   }

//   bool _onScrollNotification(
//       {required ScrollNotification scrollDetails, required Playlist playlist}) {
//     // If no more videos to load
//     if (playlist.videos.length == playlist.totalYoutubeVideos) {
//       return false;
//     }
//     // If reached the bottom of the page
//     if (scrollDetails.metrics.pixels == scrollDetails.metrics.maxScrollExtent) {
//       _loadMoreVideos();
//     }
//     return false;
//   }

//   void _onVideoSelected({required Video video, required Playlist playlist}) {
//     ref.read(selectedVideoProvider.state).state = video;
//     // Make miniplayer expand to full height of screen
//     ref
//         .read(miniPlayerControllerProvider.state)
//         .state
//         .animateToHeight(state: PanelState.MAX);

//     ref.read(vidControllerManagerNotifier).loadVideo(video.id);

//     ref.read(relatedPlaylistProvider.notifier).fetchRelatedVideos(
//           videoId: video.id,
//           nextPageToken: playlist.nextPageToken,
//         );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentPlaylist = ref.watch(currentPlaylistProvider);
//     yt_vid_ctrl = true;
//     return Scaffold(
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (scrollDetails) {
//           // Don't do anything if currently loading or playlist is empty
//           if (_isLoadingMoreVideos ||
//               currentPlaylist.isLoading ||
//               !currentPlaylist.hasValue) return true;

//           _onScrollNotification(
//             scrollDetails: scrollDetails,
//             playlist: currentPlaylist.value!,
//           );
//           return false;
//         },
//         child: CustomScrollView(
//           controller: _scrollController,
//           slivers: [
//             CustomSliverAppBar(
//               defaultSearchText: _searchText,
//               onSearch: _onSearch,
//               onEndSearch: _onSearchCleared,
//             ),
//             currentPlaylist.unwrapPrevious().when(
//                   error: (error, stackTrace) => SliverPadding(
//                     padding: const EdgeInsets.only(top: 20),
//                     sliver: SliverToBoxAdapter(
//                       child: Center(child: Text(error as String)),
//                     ),
//                   ),
//                   loading: () =>
//                       _isLoadingMoreVideos && currentPlaylist.value != null
//                           ? buildVideoList(playlist: currentPlaylist.value!)
//                           : const SliverToBoxAdapter(
//                               child: Center(child: CircularProgressIndicator()),
//                             ),
//                   data: (playlist) => playlist.videos.isEmpty
//                       ? const SliverPadding(
//                           padding: EdgeInsets.only(top: 20),
//                           sliver: SliverToBoxAdapter(
//                             child: Center(child: Text("No Videos Found")),
//                           ),
//                         )
//                       : buildVideoList(playlist: playlist),
//                 ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildVideoList({required Playlist playlist}) {
//     return SliverPadding(
//       padding: const EdgeInsets.only(bottom: 60.0),
//       sliver: VideoList(
//         playlist: playlist,
//         isLoading: _isLoadingMoreVideos,
//         onTap: (video) {
//           _onVideoSelected(video: video, playlist: playlist);
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import '../models/playlist_model.dart';
import '../models/video_model.dart';
import '../screens/nav_screen.dart';
import '../services/api_services.dart';
import '../widgets/custom_sliver_app_bar.dart';
import '../widgets/video_list.dart';
import '../screens/video_screen.dart';
import '../widgets/video_player.dart';
import '../globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  String _searchText = "";
  bool _isLoadingMoreVideos = false;
  int value = 1;

  @override
  void initState() {
    super.initState();
    // _loadMoreVideos();
    _onSearch("Recipes");
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _loadMoreVideos() async {
    // print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    setState(() {
      _isLoadingMoreVideos = true;
    });
    await ref.read(currentPlaylistProvider.notifier).loadMoreVideos(
          query: "recipe",
          fetchType: FetchType.search,
        );
    setState(() {
      _isLoadingMoreVideos = false;
    });
  }

  Future<void> _searchVideos() async {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    bool isRelatedToRecipe = await isRelatedToRecipes(_searchText);
    if (!isRelatedToRecipe) {
      _searchText = "Famous Indian Recipes Vegeterian";
    }

    setState(() {
      _searchText = _searchText;
    });
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$_searchText");
    if (_searchText != "") {
      await ref
          .read(currentPlaylistProvider.notifier)
          .searchVideos(_searchText);
    }
  }

  void _onSearchCleared() async {
    bool isRelatedToRecipe = await isRelatedToRecipes(_searchText);
    if (!isRelatedToRecipe) {
      _searchText = "Famous Indian Recipes Vegeterian";
    }

    setState(() {
      _searchText = _searchText;
    });
    _resetPlaylist();
  }

  Future<bool> isRelatedToRecipes(String message) async {
    final url =
        Uri.parse('http://10.0.0.231:8000/is_related_to_recipes_flutter');
    bool isRelated = false;

    try {
      final response =
          await http.post(url, body: jsonEncode({'message': message}));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        isRelated = result['result'];
        print(
            "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||API CALLED|||||||||||||||||||||||||||||||");
      } else {
        throw Exception(
            'Failed to call is_related_to_recipes_flutter endpoint');
      }
      
    } catch (e) {
      print("Error calling API: $e");
      // Return true if there is an error calling the API
      return true;
    }

    return isRelated;
  }

  void _onSearch(String searchText) async {
    print("}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}");

    bool isRelatedToRecipe = await isRelatedToRecipes(searchText);
    if (!isRelatedToRecipe) {
      searchText = "Famous Indian Recipes Vegeterian";
    }

    setState(() {
      _searchText = searchText;
    });

    await _searchVideos();
  }

  void _resetPlaylist() {
    print("{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}");
    ref.invalidate(currentPlaylistProvider);
    _scrollController.jumpTo(0);
  }

  bool _onScrollNotification(
      {required ScrollNotification scrollDetails, required Playlist playlist}) {
    // If no more videos to load
    if (playlist.videos.length == playlist.totalYoutubeVideos) {
      return false;
    }
    // If reached the bottom of the page
    if (scrollDetails.metrics.pixels == scrollDetails.metrics.maxScrollExtent) {
      _loadMoreVideos();
    }
    return false;
  }

  void _onVideoSelected({required Video video, required Playlist playlist}) {
    ref.read(selectedVideoProvider.state).state = video;
    // Make miniplayer expand to full height of screen
    ref
        .read(miniPlayerControllerProvider.state)
        .state
        .animateToHeight(state: PanelState.MAX);

    ref.read(vidControllerManagerNotifier).loadVideo(video.id);

    ref.read(relatedPlaylistProvider.notifier).fetchRelatedVideos(
          videoId: video.id,
          nextPageToken: playlist.nextPageToken,
        );
  }

  @override
  Widget build(BuildContext context) {
    final currentPlaylist = ref.watch(currentPlaylistProvider);
    yt_vid_ctrl = true;
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollDetails) {
          // Don't do anything if currently loading or playlist is empty
          if (_isLoadingMoreVideos ||
              currentPlaylist.isLoading ||
              !currentPlaylist.hasValue) return true;

          _onScrollNotification(
            scrollDetails: scrollDetails,
            playlist: currentPlaylist.value!,
          );
          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomSliverAppBar(
              defaultSearchText: _searchText,
              onSearch: _onSearch,
              onEndSearch: _onSearchCleared,
            ),
            currentPlaylist.unwrapPrevious().when(
                  error: (error, stackTrace) => SliverPadding(
                    padding: const EdgeInsets.only(top: 20),
                    sliver: SliverToBoxAdapter(
                      child: Center(child: Text(error as String)),
                    ),
                  ),
                  loading: () =>
                      _isLoadingMoreVideos && currentPlaylist.value != null
                          ? buildVideoList(playlist: currentPlaylist.value!)
                          : const SliverToBoxAdapter(
                              child: Center(child: CircularProgressIndicator()),
                            ),
                  data: (playlist) => playlist.videos.isEmpty
                      ? const SliverPadding(
                          padding: EdgeInsets.only(top: 20),
                          sliver: SliverToBoxAdapter(
                            child: Center(child: Text("No Videos Found")),
                          ),
                        )
                      : buildVideoList(playlist: playlist),
                ),
          ],
        ),
      ),
    );
  }

  Widget buildVideoList({required Playlist playlist}) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 60.0),
      sliver: VideoList(
        playlist: playlist,
        isLoading: _isLoadingMoreVideos,
        onTap: (video) {
          _onVideoSelected(video: video, playlist: playlist);
        },
      ),
    );
  }
}
