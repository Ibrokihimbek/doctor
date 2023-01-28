import 'package:doctor_app/ui/tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: tr('help_screen.privay_policy'),
        widget: const SizedBox(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        child: Padding(
          padding: EdgeInsets.all(height(context) * 0.02),
          child: const Text(
              'Odio eu feugiat pretium nibh ipsum consequat nisl. Tempus quam pellentesque nec nam aliquam sem et tortor consequat. Elit eget gravida cum sociis natoque penatibus. Sed elementum tempus egestas sed sed risus. Id interdum velit laoreet id donec ultrices. Fermentum leo vel orci porta non pulvinar neque laoreet. In mollis nunc sed id semper risus in hendrerit gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus. Erat nam at lectus urna duis convallis convallis. Interdum velit laoreet id donec ultrices tincidunt arcu. Sit amet venenatis urna cursus eget nunc scelerisque viverra. Purus in massa tempor nec feugiat. Hendrerit gravida rutrum quisque non tellus orci ac auctor augue. Aenean vel elit scelerisque mauris pellentesque.Odio eu feugiat pretium nibh ipsum consequat nisl. Tempus quam pellentesque nec nam aliquam sem et tortor consequat. Elit eget gravida cum sociis natoque penatibus. Sed elementum tempus egestas sed sed risus. Id interdum velit laoreet id donec ultrices. Fermentum leo vel orci porta non pulvinar neque laoreet. In mollis nunc sed id semper risus in hendrerit gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus. Erat nam at lectus urna duis convallis convallis. Interdum velit laoreet id donec ultrices tincidunt arcu.'),
        ),
      ),
    );
  }
}
