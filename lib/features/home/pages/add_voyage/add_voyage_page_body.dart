import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/components/text_form_field_decoration.dart';
import 'package:voyage_vault/features/global_widgets/select_date_form_field.dart';
import 'package:voyage_vault/features/home/pages/add_voyage/cubit/add_voyage_cubit.dart';

@immutable
class AddVoyagePageBody extends StatelessWidget {
  const AddVoyagePageBody({
    super.key,
    required this.formKey,
    required this.voyageTitles,
  });

  final List<String> voyageTitles;

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AddVoyageCubit, AddVoyageState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  _titleField(context),
                  _locationField(context),
                  _budgetField(context),
                  _dateFields(context, state),
                  _descriptionField(context),
                  for (final voyager in state.voyagers)
                    InkWell(
                      onTap: () {
                        context
                            .read<AddVoyageCubit>()
                            .selectVoyager(voyagerModel: voyager);
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
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _titleField(BuildContext context) {
    return BlocBuilder<AddVoyageCubit, AddVoyageState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) {
            context.read<AddVoyageCubit>().changeTitle(title: value);
          },
          decoration: textFormFieldDecoration(
            context,
            labelText: AppLocalizations.of(context).voyageName,
          ),
          validator: (value) => state.isTitleValid
              ? null
              : AppLocalizations.of(context).pleaseEnterVoyageTitle,
        );
      },
    );
  }

  Widget _dateFields(BuildContext context, AddVoyageState state) {
    return Row(
      children: [
        Flexible(
          child: selectDateFormField(
            context: context,
            controllerText: state.startDateFormatted,
            labelText: AppLocalizations.of(context).startDate,
            changeDate: (selectedDate) => context
                .read<AddVoyageCubit>()
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
                .read<AddVoyageCubit>()
                .changeEndDate(endDate: selectedDate),
            validator: (value) {
              if (!state.isStartDateValid) {
                return AppLocalizations.of(context).pleaseChooseDate;
              }
              if (!state.isEndDateAfterStart) {
                return AppLocalizations.of(context).endDateShouldComeAfter;
              }
              return null;
            },
            //TODO Fix too long text
          ),
        ),
      ],
    );
  }

  Widget _locationField(BuildContext context) {
    return BlocBuilder<AddVoyageCubit, AddVoyageState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) {
            context.read<AddVoyageCubit>().changeLocation(location: value);
          },
          decoration: textFormFieldDecoration(
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
    return BlocBuilder<AddVoyageCubit, AddVoyageState>(
      builder: (context, state) {
        return TextFormField(
          textAlign: TextAlign.end,
          decoration: textFormFieldDecoration(
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
            context.read<AddVoyageCubit>().changeBudget(budget: budget ?? 0);
          },
          validator: (value) => state.isBudgetValid
              ? null
              : AppLocalizations.of(context).pleaseEnterBudgetAmount,
        );
      },
    );
  }

  Widget _descriptionField(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<AddVoyageCubit>().changeDescription(description: value);
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
  }
}
