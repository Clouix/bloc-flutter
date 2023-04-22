
import 'package:bloc_application/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_repository/gif_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context.read<GifRepository>())..getData(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Ale"),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case HomeStatus.success:
              return GridView.count(
                crossAxisCount: 2,
                children: state.gifs
                    .map((gif) => Image.network(
                          gif.url,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
              );
            case HomeStatus.error:
              return const Center(child: Text("error"));
          }
        },
      ),
    );
  }
}