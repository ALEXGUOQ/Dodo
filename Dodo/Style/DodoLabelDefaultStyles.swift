import UIKit

/**

Default styles for the text label.
Default styles are used when individual element styles are not set.

*/
public struct DodoLabelDefaultStyles {
  
  /// Revert the property values to their defaults
  public static func resetToDefaults() {
    font = _font
    color = _color
    shadowColor = _shadowColor
    shadowOffset = _shadowOffset
    numberOfLines = _numberOfLines
    horizontalMargin = _horizontalMargin
  }
  
  // ---------------------------

  
  private static let _font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
  
  /// Font of the label text.
  public static var font = _font
  
  
  // ---------------------------

  
  private static let _color = UIColor.whiteColor()
  
  /// Color of the label text.
  public static var color = _color
  
  
  // ---------------------------
  

  private static let _shadowColor = TegUIColor.fromHexString("#00000050")
  
  /// Color of text shadow.
  public static var shadowColor = _shadowColor
  

  // ---------------------------

  
  private static let _shadowOffset = CGSize(width: 0, height: 1)
  
  /// Text shadow offset.
  public static var shadowOffset = _shadowOffset
  
  
  // ---------------------------

  
  private static let _numberOfLines: Int = 3
  
  /// The number of lines in the label.
  public static var numberOfLines = _numberOfLines
  
  
  // ---------------------------

  
  public static let _horizontalMargin: CGFloat = 10
  
  /// Margin between the bar/button edge and the label
  public static var horizontalMargin = _horizontalMargin
}
