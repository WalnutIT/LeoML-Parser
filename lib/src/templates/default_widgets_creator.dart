// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230706153955
// 06.07.2023 15:39

import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/article/widgets/catch_line.dart';
import 'package:leoml_parser/src/templates/article/widgets/section_headline.dart';
import 'package:leoml_parser/src/templates/blog/widgets/opening.dart';
import 'package:leoml_parser/src/templates/widgets/citation.dart';
import 'package:leoml_parser/src/templates/widgets/headline.dart';
import 'package:leoml_parser/src/templates/widgets/image.dart';
import 'package:leoml_parser/src/templates/widgets/list.dart';
import 'package:leoml_parser/src/templates/widgets/section.dart';
import 'package:leoml_parser/src/templates/widgets/sub_headline.dart';

/// Creates a default widget based on the provided object.
///
/// The [object] parameter is a LeoML object containing the necessary data to
/// create the widget.
///
/// Returns the created widget.
abstract class LeoMLWidget {
  Widget create({required Map object});
}

/// A widget creator for creating Headline widgets.
///
/// This class extends the [LeoMLWidget] class and overrides its `create`
/// method.
/// It is responsible for creating a [Headline] widget based on the provided
/// `object` data.
class HeadlineWidget extends LeoMLWidget {
  @override
  Widget create({required Map object}) =>
      Headline(object: object)..validateObject();
}

/// A widget creator for creating SubHeadline widgets.
///
/// This class extends the [LeoMLWidget] class and overrides its `create`
/// method.
/// It is responsible for creating a [SubHeadline] widget based on the provided
/// `object` data.
class SubHeadlineWidget extends LeoMLWidget {
  @override
  Widget create({required Map object}) =>
      SubHeadline(object: object)..validateObject();
}

/// A widget creator for creating SectionHeadline widgets.
///
/// This class extends the [LeoMLWidget] class and overrides its `create`
/// method.
/// It is responsible for creating a [SectionHeadline] widget based on the provided
/// `object` data.
class SectionHeadlineWidget extends LeoMLWidget {
  @override
  Widget create({required Map object}) =>
      SectionHeadline(object: object)..validateObject();
}

/// A widget creator for creating Section widgets.
///
/// This class extends the [LeoMLWidget] class and overrides its `create`
/// method.
/// It is responsible for creating a [Section] widget based on the provided
/// `object` data.
class SectionWidget extends LeoMLWidget {
  @override
  Widget create({required Map object}) =>
      Section(object: object)..validateObject();
}

/// A widget creator for creating Citation widgets.
///
/// This class extends the [LeoMLWidget] class and overrides its `create`
/// method.
/// It is responsible for creating a [Citation] widget based on the provided
/// `object` data.
class CitationWidget extends LeoMLWidget {
  @override
  Widget create({required Map object}) =>
      Citation(object: object)..validateObject();
}

/// A widget creator for creating Image widgets.
///
/// This class extends the [LeoMLWidget] class and overrides its `create`
/// method.
/// It is responsible for creating a [Image] widget based on the provided
/// `object` data.
class ImageWidget extends LeoMLWidget {
  @override
  Widget create({required Map object}) =>
      LeoImage(object: object)..validateObject();
}

/// A widget creator for creating List widgets.
///
/// This class extends the [LeoMLWidget] class and overrides its `create`
/// method.
/// It is responsible for creating a [List] widget based on the provided
/// `object` data.
class ListWidget extends LeoMLWidget {
  @override
  Widget create({required Map object}) =>
      BulletList(object: object)..validateObject();
}

/// A widget creator for creating CatchLine widgets.
///
/// This class extends the [LeoMLWidget] class and overrides its `create`
/// method.
/// It is responsible for creating a [CatchLine] widget based on the provided
/// `object` data.
class CatchLineWidget extends LeoMLWidget {
  @override
  Widget create({required Map object}) =>
      CatchLine(object: object)..validateObject();
}

/// A widget creator for creating Opening widgets.
///
/// This class extends the [LeoMLWidget] class and overrides its `create`
/// method.
/// It is responsible for creating a [Opening] widget based on the provided
/// `object` data.
class OpeningWidget extends LeoMLWidget {
  @override
  Widget create({required Map object}) =>
      Opening(object: object)..validateObject();
}
