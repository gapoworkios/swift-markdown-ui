import Foundation

/// A line break in a Markdown content block.
///
/// You can use a line break inline to force line breaks in a text.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct LineBreak: InlineContentProtocol {
  /// Creates a line break inline.
  public init() {}

  public var _inlineContent: InlineContent {
    .init(inlines: [.lineBreak])
  }
}
