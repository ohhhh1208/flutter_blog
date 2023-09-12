import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/my_colors.dart';
import '../../common/my_style.dart';
import '../../generated/l10n.dart';


class LoginInputWidget extends StatelessWidget {
  const LoginInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     /* child: Column(
        children: [
          TextField(
            controller: _phoneC,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText:  S.of(context).loginNameHint,
              hintStyle: MyStyles.style_6A6969_14,
              counter: SizedBox.shrink(),
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: MyColors.backgroundGrey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(
              color: MyColors.fontBlack,
              fontSize: 16,
            ),
            maxLines: 1,
            maxLength: 11,
          ),
          SizedBox(
            height: 8,
          ),

        ]
      ),*/
    );
  }
}
