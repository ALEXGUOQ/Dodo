import UIKit

/**

Default styles for the bar view.
Default styles are used when individual element styles are not set.

*/
public struct DodoBarDefaultStyles {
  
  /// Revert the property values to their defaults
  public static func resetToDefaults() {
    hideAfterDelaySeconds = _hideAfterDelaySeconds
    hideOnTap = _hideOnTap
    locationTop = _locationTop
    marginToSuperview = _marginToSuperview
    cornerRadius = _cornerRadius
    borderWidth = _borderWidth
    borderColor = _borderColor
    backgroundColor = _backgroundColor
    debugMode = _debugMode
  }
  
  // ---------------------------

  
  private static let _hideAfterDelaySeconds: NSTimeInterval = 3
  
  /**
  
  Hides the bar automatically after the specified number of seconds.
  The bar is kept on screen indefinitely if the value is zero.
  
  */
  public static var hideAfterDelaySeconds = _hideAfterDelaySeconds
  
  
  // ---------------------------

  
  private static let _hideOnTap = true
  
  /// When true it hides the bar when it is tapped
  public static var hideOnTap = _hideOnTap
  

  // ---------------------------

  
  private static let _locationTop = true
  
  /// Position of the bar. When true the bar is shown on top of the screen.
  public static var locationTop = _locationTop
  

  // ---------------------------
  
  
  private static let _marginToSuperview = CGSize(width: 5, height: 5)
  
  /// Margin between the bar edge and its superiew.
  public static var marginToSuperview = _marginToSuperview
  

  // ---------------------------

  
  private static let _cornerRadius: CGFloat = 20
  
  /// Corner radius of bar edges.
  public static var cornerRadius = _cornerRadius
  
  
  // ---------------------------

  
  private static let _borderWidth: CGFloat  = 1 / UIScreen.mainScreen().scale
  
  /// Border width of the bar.
  public static var borderWidth = _borderWidth
  
  
  // ---------------------------

  
  private static let _borderColor: UIColor? = nil
  
  /// Color of toolbar border.
  public static var borderColor = _borderColor
  
  
  // ---------------------------
  
  
  private static let _backgroundColor: UIColor? = nil
  
  /// Background color of the bar.
  public static var backgroundColor = _backgroundColor
  
  
  // ---------------------------

  private static let _debugMode = false
  
  /// Highlights the view backgrounds for spotting layout issues.
  public static var debugMode = _debugMode
  
  
  // ---------------------------

}