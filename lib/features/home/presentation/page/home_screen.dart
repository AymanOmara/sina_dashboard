import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/home_service_card.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              HomeTopBar(
                onMenuPressed: () {},
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: cubit.services.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (context, index) {
                    var service = cubit.services[index];
                    return HomeServiceCard(
                      display: service,
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
