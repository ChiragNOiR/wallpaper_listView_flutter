import 'package:build_6_wallpaper_app/data/models/image_data_model.dart';
import 'package:build_6_wallpaper_app/data/provider/image_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    Future.microtask(() => context.read<ImageDataProvider>().loadingImage());
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        context.read<ImageDataProvider>().loadingMoreImage();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ImageDataModel> images = context.watch<ImageDataProvider>().images;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wallpapers'),
        ),
        body: context.read<ImageDataProvider>().isLoadingImage
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: images.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          // child: Container(
                          //   padding: const EdgeInsets.all(10),
                          //   child: WebView(
                          //     javascriptMode: JavascriptMode.unrestricted,
                          //     initialUrl: images[index].url,
                          //   ),
                          // ),

                          child: Center(
                            child: Text(
                              images[index].url,
                            ),
                          )

                          // child: CachedNetworkImage(
                          //   imageUrl: images[index].url,
                          //   fit: BoxFit.cover,
                          //   width: double.infinity,
                          //   errorWidget: (context, url, error) => SizedBox(
                          //     height: MediaQuery.of(context).size.height * 0.25,
                          //     child: Center(
                          //       child: Column(
                          //         children: const [
                          //           Icon(Icons.error),
                          //           Text("Image not available")
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          ),
                    ),
                  );
                },
              ));
  }
}
