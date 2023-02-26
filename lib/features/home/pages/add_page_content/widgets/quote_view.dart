import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/features/home/pages/add_page_content/cubit/add_page_content_cubit.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPageContentCubit, AddPageContentState>(
      builder: (context, state) {
        return SizedBox(
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
                          style: const TextStyle(fontStyle: FontStyle.italic),
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
        );
      },
    );
  }
}
