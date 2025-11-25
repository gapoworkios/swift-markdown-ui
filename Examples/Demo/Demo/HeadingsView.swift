import MarkdownUI
import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct HeadingsView: View {
  private let content = """
    # Headings
    To create a heading, add one to size `#` symbols before your heading text.
    The number of `#` you use will determine the size of the heading:

    ```
    # The largest heading
    ## The second largest heading
    ###### The smallest heading
    ```

    # The largest heading
    ## The second largest heading
    ###### The smallest heading
    """

  var body: some View {
    DemoView {
      Markdown(self.content)

      Section("Customization Example") {
        Markdown("# One Big Header")
      }
      .markdownBlockStyle(\.heading1) { configuration in
        configuration.label
          .markdownMargin(top: .em(1), bottom: .em(1))
          .markdownTextStyle {
            FontFamily(.custom("Trebuchet MS"))
            FontWeight(.bold)
            FontSize(.em(2.5))
          }
      }
    }
  }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct HeadingsView_Previews: PreviewProvider {
  static var previews: some View {
    HeadingsView()
  }
}
