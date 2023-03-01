import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/components/add_edit_form_body.dart';
import 'package:voyage_vault/components/add_edit_listener.dart';
import 'package:voyage_vault/components/status_switch_case.dart';
import 'package:voyage_vault/components/form_field_decoration.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/features/home/pages/add_voyager/cubit/add_voyager_cubit.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

@immutable
class AddVoyagerPage extends StatelessWidget {
  AddVoyagerPage({super.key, this.voyageModel});

  final VoyageModel? voyageModel;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddVoyagerCubit>(
      create: (context) => getIt<AddVoyagerCubit>()..start(),
      child: BlocConsumer<AddVoyagerCubit, AddVoyagerState>(
        listener: (context, state) {
          AddEditListener(
            context: context,
            formStatus: state.formStatus,
            errorMessage: state.errorMessage,
            successMessage: state.successMessage,
          ).listen();
        },
        builder: (context, state) {
          void Function()? saveVoyager;
          saveVoyager = state.formStatus == FormStatus.initial
              ? () {
                  if (formKey.currentState!.validate()) {
                    context.read<AddVoyagerCubit>().add();
                  }
                }
              : null;

          return Scaffold(
              appBar: AddEditAppBar(
                title: AppLocalizations.of(context).addVoyager,
                saveAction: saveVoyager,
                appBar: AppBar(),
                formStatus: state.formStatus,
              ),
              body: _AddVoyagerPageBody(
                formKey: formKey,
              ));
        },
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
    return BlocBuilder<AddVoyagerCubit, AddVoyagerState>(
      builder: (context, state) {
        return StatusSwitchCase(
          context: context,
          status: state.status,
          child: () => AddEditFormBody(
            formKey: formKey,
            children: [
              _nameField(),
              _colorField(),
            ],
          ),
        );
      },
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
            context.read<AddVoyagerCubit>().changeName(name: value);
          },
          validator: (value) {
            if (!state.isNameValid) {
              return AppLocalizations.of(context).pleaseEnterVoyagerName;
            }
            if (state.doesNameExist) {
              return AppLocalizations.of(context).nameExists;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _colorField() {
    return BlocBuilder<AddVoyagerCubit, AddVoyagerState>(
      builder: (context, state) {
        Color dialogSelectColor = state.voyagerColor ?? Colors.transparent;

        return TextFormField(
          enableInteractiveSelection: false,
          focusNode: AlwaysDisabledFocusNode(),
          // controller: chosenColorController,
          onTap: () async {
            await showColorPickerDialog(
              context,
              dialogSelectColor,
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.both: false,
                ColorPickerType.primary: true,
                ColorPickerType.accent: false,
                ColorPickerType.bw: false,
                ColorPickerType.custom: false,
                ColorPickerType.wheel: false,
              },
              enableShadesSelection: false,
            ).then((newColor) {
              context.read<AddVoyagerCubit>().changeColor(color: newColor);
              return null;
            });
          },
          decoration: formFieldDecoration(
            context,
            labelText: 'Color',
            suffix: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: state.voyagerColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          validator: (value) => state.isColorValid
              ? null
              : AppLocalizations.of(context).pleaseEnterVoyagerName,
        );
      },
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
