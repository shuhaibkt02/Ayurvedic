import 'package:flutter_svg/flutter_svg.dart';

extension SvgImg on String {
  SvgPicture get svgAsset => SvgPicture.asset(this);
  SvgPicture get svgNetwork => SvgPicture.network(this);
}
