import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/features/home/pages/settings/pages/cubit/voyager_list_cubit.dart';

class VoyagerListPage extends StatelessWidget {
  const VoyagerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VoyagerListCubit>()..start(),
      child: BlocBuilder<VoyagerListCubit, VoyagerListState>(
        builder: (context, state) {
          List<VoyagerModel> voyagerModels = state.voyagers;
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
                child: ListView(
              children: [
                for (final voyager in voyagerModels)
                  ListTile(
                    title: Text(
                      voyager.name,
                      style: TextStyle(color: voyager.color),
                    ),
                  ),
                ElevatedButton(
                    onPressed: () {
                      print(voyagerModels);
                    },
                    child: Text('text'))
              ],
            )),
          );
        },
      ),
    );
  }
}
