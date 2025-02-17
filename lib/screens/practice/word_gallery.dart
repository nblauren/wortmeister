import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';
import 'package:wortmeister/core/services/srs_service.dart';
import 'package:wortmeister/data/controllers/srs_controller.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/data/models/srs.dart';
import 'package:wortmeister/data/models/srs_word.dart';
import 'package:wortmeister/screens/practice/word_flip.dart';

class WordGallery extends StatefulWidget {
  const WordGallery({super.key});

  @override
  State<WordGallery> createState() => _WordGalleryState();
}

class _WordGalleryState extends State<WordGallery> {
  final _controller = SwiperController();
  final _srsController = SrsController(
    firebaseService: LocatorService.firebaseFirestoreService,
  );

  final List<Color> buttonColors = [
    Color(0xFFFF4C4C), // 0 - Red
    Color(0xFFFF9500), // 1 - Orange
    Color(0xFFFFD700), // 2 - Yellow
    Color(0xFF90EE90), // 3 - Light Green
    Color(0xFF32CD32), // 4 - Green
    Color(0xFF007AFF), // 5 - Blue
  ];

  Future<List<SrsWord>> _getReviewCards(BuildContext context, Deck deck) async {
    return await _srsController.getReviewCards(deck.userId, deck);
  }

  Future<void> _recalculateSrs(Srs srs, int quality) async {
    final newSrs = SrsService().calculateNextReviewDate(
        lastReviewDate: srs.nextReview,
        interval: srs.interval,
        easeFactor: srs.easeFactor,
        repition: srs.reviewCount,
        quality: quality);

    await _srsController.updateSrsEntry(
      srs.srsId,
      newSrs.interval,
      newSrs.repitition,
      newSrs.easeFactor,
    );
  }

  Color _getTextColor(Color backgroundColor) {
    return ThemeData.estimateBrightnessForColor(backgroundColor) ==
            Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  Widget _ratingButton(
      context, Srs srs, int rating, int newIndex, int itemCount) {
    return ElevatedButton(
      onPressed: () async {
        await _recalculateSrs(srs, rating);
        await _controller.next();

        if (newIndex == itemCount - 1) {
          Navigator.pop(context);
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(24),
        shape: CircleBorder(),
        backgroundColor: buttonColors[rating],
        foregroundColor: _getTextColor(buttonColors[rating]),
      ),
      child: Text(rating.toString()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Deck>(
      builder: (context, deck, child) {
        return FutureBuilder<List<SrsWord>>(
          future: _getReviewCards(context, deck),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No words available'));
            } else {
              final srsWords = snapshot.data!;
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Swiper(
                    scale: 0.7,
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      final word = srsWords[index].word;
                      return Provider(
                        create: (context) => word,
                        child: WordFlip(),
                      );
                    },
                    itemCount: srsWords.length,
                    loop: false,
                    control: null,
                    pagination: SwiperCustomPagination(
                      builder: (
                        BuildContext context,
                        SwiperPluginConfig config,
                      ) {
                        final srs = srsWords[config.activeIndex].srs;
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _ratingButton(context, srs, 0,
                                    config.activeIndex, srsWords.length),
                                _ratingButton(context, srs, 1,
                                    config.activeIndex, srsWords.length),
                                _ratingButton(context, srs, 2,
                                    config.activeIndex, srsWords.length),
                                _ratingButton(context, srs, 3,
                                    config.activeIndex, srsWords.length),
                                _ratingButton(context, srs, 4,
                                    config.activeIndex, srsWords.length),
                                _ratingButton(context, srs, 5,
                                    config.activeIndex, srsWords.length),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
