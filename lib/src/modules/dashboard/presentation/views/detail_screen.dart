import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teya/src/core/components/texts/custom_text.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';
import 'package:teya/src/core/resources/sizes/size_config.dart';
import 'package:teya/src/modules/dashboard/data/models/album_feed.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/components/custom_elevated_button.dart';

class DetailScreen extends StatefulWidget {
  final AlbumModel album;
  const DetailScreen({super.key, required this.album});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isInit = true;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isInit) {
      // album =
      setState(() {
        _isInit = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isInit
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: 'image22',
                        child: Image.network(
                          widget.album.imImage?[0].label ?? '',
                          filterQuality: FilterQuality.high,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Pallet.primary,
                              )))
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: "Type - ",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              CustomText(
                                text: widget.album.category?.attributes?.term ??
                                    '',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: widget.album.title?.label ?? '',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth,
                            child: CustomElevatedButton(
                                label: "Go to APPle Music",
                                key: const Key("continue"),
                                onPressed: () async {
                                  if (!await launchUrl(
                                    Uri.parse(widget
                                            .album.link?.attributes?.href
                                            .toString() ??
                                        ""),
                                    mode: LaunchMode.externalApplication,
                                  )) {
                                    throw Exception(
                                        'Could not launch ${widget.album.link?.attributes?.href.toString()}');
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
