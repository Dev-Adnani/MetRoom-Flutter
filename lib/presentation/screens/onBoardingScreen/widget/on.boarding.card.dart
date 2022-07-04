import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metroom/core/models/on.boarding.model.dart';

class PageCard extends StatelessWidget {
  final OnBoardingModel card;

  const PageCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    space(double p) => SizedBox(height: screenHeight * p / 100);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        children: [
          space(1),
          _buildPicture(context),
          space(2),
          _buildText(context),
        ],
      ),
    );
  }

  Widget _buildPicture(
    BuildContext context, {
    double size = 380,
  }) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(
        top: 140,
      ),
      child: SvgPicture.asset(card.image!),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      card.title!,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: card.textColor,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
        letterSpacing: 0.0,
      ),
    );
  }
}
