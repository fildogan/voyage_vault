import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/features/home/pages/add_voyager/cubit/add_voyager_cubit.dart';

@immutable
class AddVoyagerPage extends StatelessWidget {
  AddVoyagerPage({super.key, this.voyageModel});

  final VoyageModel? voyageModel;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void Function()? saveVoyager;
    return BlocProvider<AddVoyagerCubit>(
      create: (context) => getIt<AddVoyagerCubit>(),
      child: BlocListener<AddVoyagerCubit, AddVoyagerState>(
        listener: (context, state) {
          if (state.formStatus == FormStatus.success) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? 'Unknown error',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.done),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(state.successMessage ?? 'Success')
                  ],
                ),
              ),
            );
          }
        },
        child: BlocBuilder<AddVoyagerCubit, AddVoyagerState>(
            builder: (context, state) {
          saveVoyager = () => context.read<AddVoyagerCubit>().add();
          // state.formStatus == FormStatus.initial
          // ? () {
          //TODO: Add save function
          // if (formKey.currentState!.validate()) {
          //   context.read<AddVoyagerCubit>().add();
          // }
          // }
          // : null;
          return Scaffold(
              appBar: AddEditAppBar(
                title: AppLocalizations.of(context).addVoyager,
                saveAction: saveVoyager,
                appBar: AppBar(),
              ),
              body: _AddVoyagerPageBody(
                formKey: formKey,
              ));
        }),
      ),
    );
  }
}

class _AddVoyagerPageBody extends StatelessWidget {
  const _AddVoyagerPageBody({
    required this.formKey,
  });

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              _nameField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameField() {
    return BlocBuilder<AddVoyagerCubit, AddVoyagerState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: AppLocalizations.of(context).voyagerName,
            contentPadding: const EdgeInsets.all(10),
          ),
          onChanged: (value) {
            // TODO: add onChanged
            // context.read<AddVoyagerCubit>().changeName(name: value);
          },
          // TODO: add validator
          // validator: (value) => state.isNameValid
          //     ? null
          //     : AppLocalizations.of(context).pleaseEnterVoyagerName,
        );
      },
    );
  }
}
