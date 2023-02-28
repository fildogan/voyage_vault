import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/components/add_edit_form_body.dart';
import 'package:voyage_vault/components/add_edit_listener.dart';
import 'package:voyage_vault/components/status_switch_case.dart';
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
        Color dialogSelectColor = state.voyagerColor ?? Colors.transparent;
        TextEditingController? chosenColorController;
        chosenColorController?.text = state.voyagerColor == null
            ? 'Press to choose color'
            : 'Press to change color';

        return StatusSwitchCase(
          context: context,
          status: state.status,
          child: () => AddEditFormBody(
            formKey: formKey,
            children: [
              _nameField(),
              // ColorPickerFormField(
              //   context: context,
              //   dialogSelectColor: dialogSelectColor,
              //   initialValue: dialogSelectColor,
              //   isColorValid: state.isColorValid,
              // ),
              // _colorPicker(context, dialogSelectColor),
              // ElevatedButton(
              //     onPressed: () {
              //       print(state.voyagerColor);
              //     },
              //     child: Text('text'))
              TextFormField(
                enableInteractiveSelection: false,
                focusNode: AlwaysDisabledFocusNode(),
                controller: chosenColorController,
                // initialValue: state.voyagerColor == null
                //     ? 'Press to choose color'
                //     : 'Press to change color',
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
                    context
                        .read<AddVoyagerCubit>()
                        .changeColor(color: newColor);
                    return null;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: state.voyagerColor,
                  labelText: 'Color',
                  contentPadding: EdgeInsets.all(10),
                ),
                validator: (value) => state.isColorValid
                    ? null
                    : AppLocalizations.of(context).pleaseEnterVoyagerName,
              ),
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
              //TODO: add translation
              return 'Name exists';
            }
            return null;
          },
        );
      },
    );
  }

  ElevatedButton _colorPicker(BuildContext context, Color dialogSelectColor) {
    // TODO: add validation
    return ElevatedButton(
        onPressed: () async {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Pick color'),
            ColorIndicator(
              height: 30,
              width: 30,
              color: dialogSelectColor,
            )
          ],
        ));
  }
}

class ColorPickerFormField extends FormField<Color?> {
  ColorPickerFormField({
    Key? key,
    // FormFieldSetter<Color?>? onSaved,
    FormFieldValidator<Color?>? validator,
    Color? initialValue,
    bool enabled = true,
    required bool isColorValid,
    required BuildContext context,
    required Color dialogSelectColor,
  }) : super(
          key: key,
          // onSaved: onSaved,
          validator: (value) => isColorValid
              ? null
              : AppLocalizations.of(context).pleaseEnterVoyagerName,
          initialValue: initialValue,
          builder: (FormFieldState<Color?> state) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: enabled
                      ? () async {
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
                            context
                                .read<AddVoyagerCubit>()
                                .changeColor(color: newColor);
                            return null;
                          });
                        }
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Pick color'),
                      ColorIndicator(
                        height: 30,
                        width: 30,
                        color: dialogSelectColor,
                      ),
                    ],
                  ),
                ),
                state.hasError
                    ? Text(
                        AppLocalizations.of(context).pleaseEnterVoyagerName,
                        // state.errorText ?? '',
                        style:
                            Theme.of(context).inputDecorationTheme.errorStyle,
                      )
                    : Container()
              ],
            );
          },
        );
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
