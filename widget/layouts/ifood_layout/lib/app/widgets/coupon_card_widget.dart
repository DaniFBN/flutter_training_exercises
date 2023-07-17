import 'package:flutter/material.dart';

class CouponCardWidget extends StatelessWidget {
  const CouponCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFcff2dc),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: Color(0xFF106840),
            ),
            SizedBox(width: 4),
            Text(
              r'Cupom de R$ 20 disponível',
              style: TextStyle(
                color: Color(0xFF106840),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
