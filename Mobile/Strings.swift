// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {
  /// Title of the alert
  static let alertTitle = L10n.tr("Strings", "alert_title")

  enum Disciplina {
    /// Aula
    static let aula = L10n.tr("Strings", "disciplina.aula")
    /// Frequencia
    static let frequencia = L10n.tr("Strings", "disciplina.frequencia")
    /// Disciplina
    static let info = L10n.tr("Strings", "disciplina.info")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
