import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../core/core.dart';
import '../../cubit/location_cubit.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Mengatur posisi elemen
      children: [
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (cityDetail) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${cityDetail.date} ${cityDetail.month} ${cityDetail.year}',
                        style: TextStyles.textMdSemiBold
                            .copyWith(color: Pallet.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${cityDetail.locality}, ${cityDetail.country}',
                    style:
                        TextStyles.textSmRegular.copyWith(color: Pallet.white),
                  ),
                ],
              ),
              error: (message) => Text(
                'Error: $message',
                style: const TextStyle(color: Colors.red),
              ),
              orElse: () => const Text('Tidak ada informasi lokasi.'),
            );
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Pallet.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
