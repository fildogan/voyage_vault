import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/features/home/pages/add_expense/add_expense_page.dart';
import 'package:voyage_vault/features/home/pages/add_page_content/cubit/add_page_content_cubit.dart';
import 'package:voyage_vault/features/home/pages/add_page_content/widgets/add_button.dart';
import 'package:voyage_vault/features/home/pages/add_page_content/widgets/quote_view.dart';
import 'package:voyage_vault/features/home/pages/add_voyage/add_voyage_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/features/home/pages/add_voyager/add_voyager_page.dart';

class AddPageContent extends StatelessWidget {
  const AddPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPageContentCubit>(
      create: (context) => getIt<AddPageContentCubit>()..start(),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              Image.asset(
                'assets/images/logo1.png',
                height: 300,
              ),
              const Spacer(flex: 1),
              const QuoteView(),
              const Spacer(flex: 1),
              AddButton(
                title: AppLocalizations.of(context).addVoyage,
                pageRoute: const AddVoyagePage(),
              ),
              AddButton(
                title: AppLocalizations.of(context).addExpense,
                pageRoute: AddExpensePage(),
              ),
              AddButton(
                title: AppLocalizations.of(context).addVoyager,
                pageRoute: AddVoyagerPage(),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
