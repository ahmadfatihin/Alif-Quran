import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../../../core/core.dart';
import '../../../data/models/ayat_model.dart';
import '../../../data/models/surah_model.dart';
import '../../cubit/quran_cubit.dart';
import 'package:audioplayers/audioplayers.dart';

class QuranScreen extends StatefulWidget {
  final int surahId;

  const QuranScreen({super.key, required this.surahId});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isDataFetched = false; // Flag untuk cek apakah data sudah di-fetch

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    final quranCubit = GetIt.I<QuranCubit>();

    if (!quranCubit.isClosed && !_isDataFetched) {
      quranCubit.getQuranData(widget.surahId);
      _isDataFetched = true;
    }

    _audioPlayer.onPlayerStateChanged.listen((state) {
      log("Player state changed: $state");
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(builder: (context, state) {
      log(state.runtimeType.toString());
      log(state.toString());

      return Scaffold(
        appBar: AppBar(
          title: state.maybeWhen(
            success: (surahModel) => Text(surahModel.nama),
            orElse: () => const Text(''),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/listQuran'),
          ),
        ),
        body: _buildBody(state),
      );
    });
  }

  Widget _buildBody(QuranState state) {
    return state.maybeWhen(
      success: (surahModel) => Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView.builder(
          itemCount: surahModel.jumlahAyat + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildSurahInfoCard(surahModel); // Kartu informasi surah
            } else {
              return _buildAyatTile(surahModel.ayat[index - 1], index);
            }
          },
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error) => _buildErrorView(error),
      orElse: () => const Center(child: Text("Tidak ada data tersedia")),
    );
  }

  Widget _buildSurahInfoCard(SurahModel surahModel) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      color: Pallet.white,
      elevation: 2,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${surahModel.namaLatin} - ${surahModel.nama}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(Icons.list),
                        const SizedBox(width: 5),
                        Text('Jumlah Ayat: ${surahModel.jumlahAyat}'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 5),
                        Text('Tempat Turun: ${surahModel.tempatTurun}'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => _togglePlayAudio(surahModel.audio),
              child: Material(
                color: _isPlaying ? Colors.red : Colors.blue,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      _isPlaying ? 'Pause Audio' : 'Play Audio',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _togglePlayAudio(String audioUrl) async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() {
          _isPlaying = false; // Perbarui status pemutaran
        });
      } else {
        // Memanggil play, tetapi kita tidak bisa menggunakan hasilnya
        await _audioPlayer.play(UrlSource(audioUrl));
        setState(() {
          _isPlaying = true; // Perbarui status pemutaran
        });
      }
    } catch (e) {
      log("Error playing audio: $e");
      // Tampilkan pesan kesalahan ke pengguna jika perlu
    }
  }

  Widget _buildAyatTile(AyatModel ayat, int nomorAyat) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      color: Pallet.white,
      elevation: 2,
      child: ListTile(
        title: Text(
          ayat.ar,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            HtmlWidget(
              ayat.tr,
              textStyle: const TextStyle(color: Pallet.cyan),
            ),
            const SizedBox(height: 3),
            Text(ayat.idn),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView(AppException error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Kesalahan: ${error.message}'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final quranCubit = GetIt.I<QuranCubit>();
              if (!quranCubit.isClosed) {
                quranCubit.getQuranData(widget.surahId);
              }
            },
            child: const Text('Coba Lagi'),
          ),
        ],
      ),
    );
  }
}
