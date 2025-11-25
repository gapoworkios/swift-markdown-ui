import Foundation

/// A code span in a Markdown content block.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct Code: InlineContentProtocol {
  public var _inlineContent: InlineContent {
    .init(inlines: [.code(self.text)])
  }

  private let text: String

  /// Creates a code span inline element.
  /// - Parameter text: The text content inside the code span.
  public init(_ text: String) {
    self.text = text
  }
}
