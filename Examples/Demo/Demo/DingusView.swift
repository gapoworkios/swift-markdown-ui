import MarkdownUI
import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct DingusView: View {
  @State private var markdown = """
    ## Try GitHub Flavored Markdown

    You can try **GitHub Flavored Markdown** here.  This dingus is powered
    by [MarkdownUI](https://github.com/gonzalezreal/MarkdownUI), a native
    Markdown renderer for SwiftUI.

    1. item one
    1. item two
       - sublist
       - sublist
    """

  var body: some View {
    DemoView {
      Section("Editor") {
        TextEditor(text: $markdown)
          .font(.system(.callout, design: .monospaced))
      }

      Section("Preview") {
        Markdown(self.markdown)
      }
    }
  }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct DingusView_Previews: PreviewProvider {
  static var previews: some View {
    DingusView()
  }
}
