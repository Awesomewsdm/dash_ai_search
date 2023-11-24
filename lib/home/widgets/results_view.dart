import 'package:app_ui/app_ui.dart';
import 'package:dash_ai_search/home/home.dart';
import 'package:dash_ai_search/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final response =
        context.select((HomeBloc bloc) => bloc.state.vertexResponse);
    return Stack(
      children: [
        Align(child: BlueContainer(summary: response.summary)),
      ],
    );
  }
}

class BlueContainer extends StatelessWidget {
  @visibleForTesting
  const BlueContainer({required this.summary, super.key});

  final String summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: VertexColors.googleBlue,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              summary,
              style: VertexTextStyles.body
                  .copyWith(color: VertexColors.white, fontSize: 32),
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: FeedbackButtons(),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: SeeSourceAnswersButton(),
          ),
        ],
      ),
    );
  }
}

class FeedbackButtons extends StatelessWidget {
  @visibleForTesting
  const FeedbackButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Like(),
        SizedBox(
          width: 16,
        ),
        Dislike(),
      ],
    );
  }
}

class Like extends StatelessWidget {
  @visibleForTesting
  const Like({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedbackButton(
      icon: vertexImages.thumbUp.image(),
    );
  }
}

class Dislike extends StatelessWidget {
  @visibleForTesting
  const Dislike({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedbackButton(
      icon: vertexImages.thumbDown.image(),
    );
  }
}

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({
    required this.icon,
    this.onPressed,
    super.key,
  });

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: VertexColors.white,
      radius: 32,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox.square(dimension: 33, child: icon),
      ),
    );
  }
}

class SeeSourceAnswersButton extends StatelessWidget {
  const SeeSourceAnswersButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      height: 64,
      child: TertiaryCTA(
        label: l10n.seeSourceAnswers,
        icon: vertexIcons.arrowForward.image(),
      ),
    );
  }
}
