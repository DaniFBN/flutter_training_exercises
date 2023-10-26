import 'package:flutter/material.dart';
import 'package:internationalization_response/app/l10n/gen/app_localizations_extension.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: theme.textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 30)),
              lastDate: DateTime.now().add(const Duration(days: 30)),
            );
          },
          child: Text(
            context.intl.seeAll,
            semanticsLabel: 'See All $title',
          ),
        ),
      ],
    );
  }
}
