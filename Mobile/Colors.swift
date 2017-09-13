// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  typealias Color = UIColor
#endif

// swiftlint:disable file_length

// swiftlint:disable operator_usage_whitespace
extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

// swiftlint:disable identifier_name line_length type_body_length
struct ColorName {
  let rgbaValue: UInt32
  var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#339666"></span>
  /// Alpha: 100% <br/> (0x339666ff)
  static let articleBody = ColorName(rgbaValue: 0x339666ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff66cc"></span>
  /// Alpha: 100% <br/> (0xff66ccff)
  static let articleFootnote = ColorName(rgbaValue: 0xff66ccff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#33fe66"></span>
  /// Alpha: 100% <br/> (0x33fe66ff)
  static let articleTitle = ColorName(rgbaValue: 0x33fe66ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f16364"></span>
  /// Alpha: 100% <br/> (0xf16364ff)
  static let cor0 = ColorName(rgbaValue: 0xf16364ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f58559"></span>
  /// Alpha: 100% <br/> (0xf58559ff)
  static let cor1 = ColorName(rgbaValue: 0xf58559ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f9a43e"></span>
  /// Alpha: 100% <br/> (0xf9a43eff)
  static let cor2 = ColorName(rgbaValue: 0xf9a43eff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e4c62e"></span>
  /// Alpha: 100% <br/> (0xe4c62eff)
  static let cor3 = ColorName(rgbaValue: 0xe4c62eff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#67bf74"></span>
  /// Alpha: 100% <br/> (0x67bf74ff)
  static let cor4 = ColorName(rgbaValue: 0x67bf74ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#59a2be"></span>
  /// Alpha: 100% <br/> (0x59a2beff)
  static let cor5 = ColorName(rgbaValue: 0x59a2beff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2093cd"></span>
  /// Alpha: 100% <br/> (0x2093cdff)
  static let cor6 = ColorName(rgbaValue: 0x2093cdff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ad62a7"></span>
  /// Alpha: 100% <br/> (0xad62a7ff)
  static let cor7 = ColorName(rgbaValue: 0xad62a7ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#805781"></span>
  /// Alpha: 100% <br/> (0x805781ff)
  static let cor8 = ColorName(rgbaValue: 0x805781ff)
}
// swiftlint:enable identifier_name line_length type_body_length

extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
