import SwiftUI

@available(iOS 15.0, *)
extension View {
  /// Sets the table border style for the Markdown tables in a view hierarchy.
  ///
  /// Use this modifier to customize the table border style inside the body of
  /// the ``Theme/table`` block style.
  ///
  /// - Parameter tableBorderStyle: The border style to set.
  public func markdownTableBorderStyle(_ tableBorderStyle: TableBorderStyle) -> some View {
    self.environment(\.tableBorderStyle, tableBorderStyle)
  }

  /// Sets the table background style in a view hierarchy.
  /// - Parameter tableBackgroundStyle: The table background style to set.
  /// - Returns: A view that uses the specified table background style for itself and its child views.
  @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
  public func markdownTableBackgroundStyle(_ tableBackgroundStyle: TableBackgroundStyle) -> some View {
    self.environment(\.tableBackgroundStyle, tableBackgroundStyle)
  }
}

@available(iOS 15.0, *)
extension EnvironmentValues {
  var tableBorderStyle: TableBorderStyle {
    get { self[TableBorderStyleKey.self] }
    set { self[TableBorderStyleKey.self] = newValue }
  }

  @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
  var tableBackgroundStyle: TableBackgroundStyle {
    get { self[TableBackgroundStyleKey.self] }
    set { self[TableBackgroundStyleKey.self] = newValue }
  }
}

@available(iOS 15.0, *)
private struct TableBorderStyleKey: EnvironmentKey {
  static let defaultValue = TableBorderStyle(color: .secondary)
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
private struct TableBackgroundStyleKey: EnvironmentKey {
  static let defaultValue = TableBackgroundStyle.clear
}
