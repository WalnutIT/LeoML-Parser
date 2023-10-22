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
import 'package:leoml_parser/src/templates/expansion_tile/widgets/content.dart';
import 'package:leoml_parser/src/templates/expansion_tile/widgets/header.dart';
import 'package:leoml_parser/src/templates/expansion_tile/widgets/paragraph_headline.dart';
import 'package:leoml_parser/src/templates/expansion_tile/widgets/paragraph.dart';
import 'package:leoml_parser/src/templates/widgets/section_headline.dart';
import 'package:leoml_parser/src/templates/blog/widgets/opening.dart';
import 'package:leoml_parser/src/templates/widgets/citation.dart';
import 'package:leoml_parser/src/templates/widgets/headline.dart';
import 'package:leoml_parser/src/templates/widgets/image.dart';
import 'package:leoml_parser/src/templates/widgets/list.dart';
import 'package:leoml_parser/src/templates/widgets/section.dart';
import 'package:leoml_parser/src/templates/widgets/sub_headline.dart';
import 'package:leoml_parser/src/widget_builder/leo_ml_widget_builder.dart';

/// A widget builder for building Headline widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Headline] widget based on the provided
/// `object` data.
class HeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      Headline(object: object)..validateObject();
}

/// A widget builder for building SubHeadline widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [SubHeadline] widget based on the provided
/// `object` data.
class SubHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      SubHeadline(object: object)..validateObject();
}

/// A widget builder for building SectionHeadline widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [SectionHeadline] widget based on the provided
/// `object` data.
class SectionHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      SectionHeadline(object: object)..validateObject();
}

/// A widget builder for building Section widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Section] widget based on the provided
/// `object` data.
class SectionBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      Section(object: object)..validateObject();
}

/// A widget builder for building Citation widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Citation] widget based on the provided
/// `object` data.
class CitationBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      Citation(object: object)..validateObject();
}

/// A widget builder for building Image widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Image] widget based on the provided
/// `object` data.
class ImageBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      LeoImage(object: object)..validateObject();
}

/// A widget builder for building List widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [List] widget based on the provided
/// `object` data.
class ListBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      BulletList(object: object)..validateObject();
}

/// A widget builder for building CatchLine widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [CatchLine] widget based on the provided
/// `object` data.
class CatchLineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      CatchLine(object: object)..validateObject();
}

/// A widget builder for building Opening widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Opening] widget based on the provided
/// `object` data.
class OpeningBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      Opening(object: object)..validateObject();
}

/// A widget builder for building Opening widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [ParagraphHeadline] widget based on the provided
/// `object` data.
class ParagraphHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      ParagraphHeadline(object: object)..validateObject();
}

/// A widget builder for building Opening widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Paragraph] widget based on the provided
/// `object` data.
class ParagraphBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      Paragraph(object: object)..validateObject();
}

/// A widget builder for building header widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Header] widget based on the provided
/// `object` data.
class HeaderBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      Header(object: object)..validateObject();
}

/// A widget builder for building content widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Content] widget based on the provided
/// `object` data.
class ContentBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      Content(object: object)..validateObject();
}
