import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/components/add_edit_form_body.dart';
import 'package:voyage_vault/components/form_field_decoration.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/features/global_widgets/select_date_form_field.dart';
import 'package:voyage_vault/features/home/pages/edit_voyage/cubit/edit_voyage_cubit.dart';

@immutable
class EditVoyagePageBody extends StatelessWidget {
  const EditVoyagePageBody({
    super.key,
    required this.formKey,
    required this.voyageTitles,
  });

  final List<String> voyageTitles;

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<EditVoyageCubit, EditVoyageState>(
        builder: (context, state) {
          return AddEditFormBody(
            formKey: formKey,
            children: [
              _titleField(context),
              _locationField(context),
              _budgetField(context),
              _dateFields(context, state),
              _descriptionField(context),
              for (final voyager in state.voyagers)
                _voyagerField(context, voyager)
            ],
          );
        },
      ),
    );
  }

  Widget _titleField(BuildContext context) {
    return BlocBuilder<EditVoyageCubit, EditVoyageState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title,
          onChanged: ((value) {
            context.read<EditVoyageCubit>().changeTitle(title: value);
          }),
          decoration: formFieldDecoration(
            context,
            labelText: AppLocalizations.of(context).voyageName,
          ),
          validator: (value) {
            if (!state.isTitleValid) {
              return AppLocalizations.of(context).pleaseEnterVoyageTitle;
            }
            if (state.doesTitleExist) {
              return 'Title exists';
            }
            return null;
          },
        );
      },
    );
  }

  Widget _locationField(BuildContext context) {
    return BlocBuilder<EditVoyageCubit, EditVoyageState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.location,
          onChanged: (value) {
            context.read<EditVoyageCubit>().changeLocation(location: value);
          },
          decoration: formFieldDecoration(
            context,
            labelText: AppLocalizations.of(context).destination,
          ),
          validator: (value) => state.isLocationValid
              ? null
              : AppLocalizations.of(context).pleaseEnterVoyageDestination,
        );
      },
    );
  }

  Widget _budgetField(BuildContext context) {
    return BlocBuilder<EditVoyageCubit, EditVoyageState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.budgetString,
          textAlign: TextAlign.start,
          decoration: formFieldDecoration(
            context,
            labelText: AppLocalizations.of(context).budget,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'^\d*\.?\d{0,2}'),
            ),
          ],
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (value) {
            final budget = double.tryParse(value);
            context.read<EditVoyageCubit>().changeBudget(budget: budget ?? 0);
          },
          validator: (value) => state.isBudgetValid
              ? null
              : AppLocalizations.of(context).pleaseEnterBudgetAmount,
        );
      },
    );
  }

  Row _dateFields(BuildContext context, EditVoyageState state) {
    return Row(
      children: [
        Flexible(
          child: selectDateFormField(
            context: context,
            controllerText: state.startDateFormatted,
            labelText: AppLocalizations.of(context).startDate,
            changeDate: (selectedDate) => context
                .read<EditVoyageCubit>()
                .changeStartDate(startDate: selectedDate),
            validator: (value) => state.isStartDateValid
                ? null
                : AppLocalizations.of(context).pleaseChooseDate,
            //TODO Fix too long text
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Flexible(
          child: selectDateFormField(
            context: context,
            controllerText: state.endDateFormatted,
            labelText: AppLocalizations.of(context).endDate,
            changeDate: (selectedDate) => context
                .read<EditVoyageCubit>()
                .changeStartDate(startDate: selectedDate),
            validator: (value) {
              if (!state.isStartDateValid) {
                return AppLocalizations.of(context).pleaseChooseDate;
              }
              if (!state.isEndDateAfterStart) {
                return AppLocalizations.of(context).endDateShouldComeAfter;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _descriptionField(BuildContext context) {
    return BlocBuilder<EditVoyageCubit, EditVoyageState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.description,
          onChanged: (value) {
            context
                .read<EditVoyageCubit>()
                .changeDescription(description: value);
          },
          maxLines: null,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: AppLocalizations.of(context).description,
            labelStyle: const TextStyle(),
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.all(10),
          ),
        );
      },
    );
  }

  InkWell _voyagerField(BuildContext context, VoyagerModel voyager) {
    return InkWell(
      onTap: () {
        context.read<EditVoyageCubit>().selectVoyager(voyagerModel: voyager);
      },
      child: TextFormField(
        decoration: InputDecoration(
            suffixIcon: voyager.isSelected ?? false
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            icon: Container(
              height: 20,
              width: 20,
              color: voyager.color,
            )),
        initialValue: voyager.name,
        enabled: false,
      ),
    );
  }
}
