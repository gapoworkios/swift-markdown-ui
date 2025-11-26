import MarkdownUI
import Splash
import SwiftUI

@available(iOS 15.0, *)
struct SplashCodeSyntaxHighlighter: CodeSyntaxHighlighter {
  private let syntaxHighlighter: SyntaxHighlighter<TextOutputFormat>

  init(theme: Splash.Theme) {
    self.syntaxHighlighter = SyntaxHighlighter(format: TextOutputFormat(theme: theme))
  }

  func highlightCode(_ content: String, language: String?) -> Text {
    guard language != nil else {
      return Text(content)
    }

    return self.syntaxHighlighter.highlight(content)
  }
}

@available(iOS 15.0, *)
extension CodeSyntaxHighlighter where Self == SplashCodeSyntaxHighlighter {
  static func splash(theme: Splash.Theme) -> Self {
    SplashCodeSyntaxHighlighter(theme: theme)
  }
}
