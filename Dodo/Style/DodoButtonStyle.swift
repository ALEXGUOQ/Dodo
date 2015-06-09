import UIKit

/// Defines styles for the bar button.
public class DodoButtonStyle {
  
  /// The parent style is used to get the property value if the object is missing one.
  var parent: DodoButtonStyle?
  
  init(parentStyle: DodoButtonStyle? = nil) {
    self.parent = parentStyle
  }
  
  /// Clears the styles for all properties for this style object. The styles will be taken from parent and default properties.
  public func clear() {
    _image = nil
    _icon = nil
    _accessibilityLabel = nil
    _onTap = nil
    _size = nil
    _horizontalMarginToBar = nil
    _tintColor = nil
    _hideOnTap = nil
  }
  
  // -----------------------------
  
  private var _image: UIImage?
  
  /// Button image. Button only shown when the image is present. The color of the image can be changes with tintColor property.
  public var image: UIImage? {
    get {
      return _image ?? parent?.image ?? DodoButtonDefaultStyles.image
    }
    
    set {
      _image = newValue
    }
  }
  
  // ---------------------------
  
  private var _icon: DodoIcons?
  
  /// Icon that will be shown in the button.
  public var icon: DodoIcons? {
    get {
      return _icon ?? parent?.icon ?? DodoButtonDefaultStyles.icon
    }
    
    set {
      _icon = newValue
    }
  }
  
  // -----------------------------

  private var _accessibilityLabel: String?
  
  /**
  
  This text is spoken by the device when it is in accessibility mode. It is recommended to always set the accessibility label for your button. The text can be a short localized description of the button function, for example: "Close", "Reload" etc.
  
  */
  public var accessibilityLabel: String? {
    get {
      return _accessibilityLabel ?? parent?.accessibilityLabel ?? DodoButtonDefaultStyles.accessibilityLabel
    }
    
    set {
      _accessibilityLabel = newValue
    }
  }
  
  // -----------------------------
  
  private var _onTap: DodoButtonOnTap?
  
  /// A closure that is called when user taps the button.
  public var onTap: DodoButtonOnTap? {
    get {
      return _onTap ?? parent?.onTap ?? DodoButtonDefaultStyles.onTap
    }
    
    set {
      _onTap = newValue
    }
  }
  
  // -----------------------------
  
  private var _size: CGSize?
  
  /// Size of the button
  public var size: CGSize {
    get {
      return _size ?? parent?.size ?? DodoButtonDefaultStyles.size
    }
    
    set {
      _size = newValue
    }
  }
  
  // -----------------------------
  
  private var _horizontalMarginToBar: CGFloat?
  
  /// Horizontal margin between the bar edge and the button.
  public var horizontalMarginToBar: CGFloat {
    get {
      return _horizontalMarginToBar ?? parent?.horizontalMarginToBar ??
        DodoButtonDefaultStyles.horizontalMarginToBar
    }
    
    set {
      _horizontalMarginToBar = newValue
    }
  }
  
  // -----------------------------
  
  private var _tintColor: UIColor?
  
  /// Button tint color. When set it is used to replace the image colors.
  public var tintColor: UIColor? {
    get {
      return _tintColor ?? parent?.tintColor ?? DodoButtonDefaultStyles.tintColor
    }
    
    set {
      _tintColor = newValue
    }
  }
  
  
  // -----------------------------
  
  private var _hideOnTap: Bool?
  
  /// When true it hides the bar when the button is tapped
  public var hideOnTap: Bool {
    get {
      return _hideOnTap ?? parent?.hideOnTap ?? DodoButtonDefaultStyles.hideOnTap
    }
    
    set {
      _hideOnTap = newValue
    }
  }
}
