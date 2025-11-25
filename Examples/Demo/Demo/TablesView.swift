import MarkdownUI
import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct TablesView: View {
  let content = """
    You can create tables with pipes `|` and hyphens `-`. Hyphens are used to
    create each column's header, while pipes separate each column. You must
    include a blank line before your table for it to render correctly.

    ```
    | First Header  | Second Header |
    | ------------- | ------------- |
    | Content Cell  | Content Cell  |
    | Content Cell  | Content Cell  |
    ```

    | First Header  | Second Header |
    | ------------- | ------------- |
    | Content Cell  | Content Cell  |
    | Content Cell  | Content Cell  |

    ## Formatting content within your table

    You can use formatting such as links, inline code blocks, and text styling
    within your table:

    ```
    | Command | Description |
    | --- | --- |
    | `git status` | List all *new or modified* files |
    | `git diff` | Show file differences that **haven't been** staged |
    ```

    | Command | Description |
    | --- | --- |
    | `git status` | List all *new or modified* files |
    | `git diff` | Show file differences that **haven't been** staged |

    ## Further reading
    - [GitHub Flavored Markdown Spec](https://github.github.com/gfm/)
    """

  var body: some View {
    DemoView {
      Markdown(self.content)
    }
  }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct TablesView_Previews: PreviewProvider {
  static var previews: some View {
    TablesView()
  }
}
