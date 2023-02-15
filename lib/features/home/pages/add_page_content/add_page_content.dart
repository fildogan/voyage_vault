import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/features/home/pages/add_expense/add_expense_page.dart';
import 'package:voyage_vault/features/home/pages/add_page_content/cubit/add_page_content_cubit.dart';
import 'package:voyage_vault/features/home/pages/add_voyage/add_voyage_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddPageContent extends StatelessWidget {
  const AddPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPageContentCubit>(
      create: (context) => getIt<AddPageContentCubit>()..start(),
      child: BlocBuilder<AddPageContentCubit, AddPageContentState>(
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Image.asset(
                    'assets/images/logo1.png',
                    height: 300,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    height: 80,
                    child: Visibility(
                      visible: state.chosenQuote != null ? true : false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: state.chosenQuote == null
                              ? []
                              : [
                                  AutoSizeText(
                                    '"${state.chosenQuote!.title}"',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic),
                                    maxLines: 2,
                                  ),
                                  AutoSizeText(
                                    '- ${state.chosenQuote!.author}',
                                    textAlign: TextAlign.end,
                                    maxLines: 1,
                                  ),
                                ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddVoyagePage(),
                        fullscreenDialog: true,
                      ),
                    ),
                    child: Text(AppLocalizations.of(context).addVoyage),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddExpensePage(),
                        fullscreenDialog: true,
                      ),
                    ),
                    child: Text(AppLocalizations.of(context).addExpense),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
