import UIKit
import Dodo

class ViewController: UIViewController {
  
  @IBOutlet weak var testToolbar: UIToolbar!
  @IBOutlet weak var topSwitch: UISwitch!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var hideAfterDelaySwitch: UISwitch!
  @IBOutlet weak var hideOnTapSwitch: UISwitch!
  @IBOutlet weak var leftButtonSwitch: UISwitch!
  @IBOutlet weak var rightButtonSwitch: UISwitch!
  @IBOutlet weak var debugModeSwitch: UISwitch!
  @IBOutlet weak var showAnimationButton: UIButton!
  @IBOutlet weak var hideAnimationButton: UIButton!
  
  let animations = [
    DodoAnimations.Fade,
    DodoAnimations.NoAnimation,
    DodoAnimations.Rotate,
    DodoAnimations.SlideLeft,
    DodoAnimations.SlideRight,
    DodoAnimations.SlideVertically
  ]
  
  var currentShowAnimationIndex = 2
  var currentHideAnimationIndex = 2

  var timer: MoaTimer?
  
  var message = "Failure is success if we learn from it."
  
  let backgroundImages = [
    "flowers.jpg",
    "black.png",
    "white.png"
  ]
  var currentImageIndex = 0
  
  var titleLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.dodo.topLayoutGuide = topLayoutGuide
    updateShowAnimationButtonTitle()
    updateHideAnimationButtonTitle()
  }
  
  private func changeBackgroundImage() {
    currentImageIndex += 1
    if currentImageIndex >= backgroundImages.count  { currentImageIndex = 0 }
    
    // Get the new image to be shown
    
    let imageName = backgroundImages[currentImageIndex]
    let newImage = UIImage(named: imageName)
    
    // Create a new image view
    
    let newImageView = UIImageView()
    newImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
    newImageView.image = newImage
    newImageView.contentMode = UIViewContentMode.ScaleAspectFill
    view.insertSubview(newImageView, aboveSubview: imageView)
    TegAutolayoutConstraints.fillParent(newImageView, parentView: view, margin: 0, vertically: false)
    TegAutolayoutConstraints.fillParent(newImageView, parentView: view, margin: 0, vertically: true)
    
    // Fade in new image view
    
    newImageView.alpha = 0
    
    UIView.animateWithDuration(0.1,
      animations: {
        newImageView.alpha = 1
      },
      completion: { [weak self] finished in
        self?.imageView.image = newImage
        newImageView.removeFromSuperview()
      }
    )
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  @IBAction func onSuccessButtonTapped(sender: AnyObject) {
    message = "Dodo, a message bar for iOS."
    view.dodo.preset = DodoPresets.Success
    show()
  }
  
  @IBAction func onInfoButtonTapped(sender: AnyObject) {
    message = "Information is not knowledge."
    view.dodo.preset = DodoPresets.Info
    show()
  }
  
  @IBAction func onWarningButtonTapped(sender: AnyObject) {
    message = "If the doors of perception were cleansed everything would appear to man as it is, Infinite."
    view.dodo.preset = DodoPresets.Warning
    show()
  }
  
  @IBAction func onErrorButtonTapped(sender: AnyObject) {
    message = "Failure is success if we learn from it."
    view.dodo.preset = DodoPresets.Error
    show()
  }
  
  @IBAction func onHideButtonTapped(sender: AnyObject) {
    view.dodo.hide()
  }
  
  @IBAction func onTopSwitchChanged(sender: AnyObject) {
    show()
  }
  
  @IBAction func onHideAfterDelaySwitchChanged(sender: UISwitch) {
    show()
  }
  
  @IBAction func onHideOnTapSwitchChanged(sender: AnyObject) {
    show()
  }
  
  @IBAction func onLeftButtonSwitchChanged(sender: AnyObject) {
    show()
  }
  
  @IBAction func onRightButtonSwitchChanged(sender: AnyObject) {
    show()
  }
  
  @IBAction func onDebugModeSwitchChanged(sender: AnyObject) {
    show()
  }
  
  @IBAction func onChangeBackgroundTapped(sender: AnyObject) {
    changeBackgroundImage()
  }
  
  private func show() {
    view.dodo.style.bar.locationTop = topSwitch.on
    view.dodo.style.bar.hideAfterDelaySeconds = hideAfterDelaySwitch.on ? 3 : 0
    view.dodo.style.bar.debugMode = debugModeSwitch.on
    view.dodo.style.bar.hideOnTap = hideOnTapSwitch.on
    view.dodo.style.label.shadowColor = DodoColor.fromHexString("#00000050")
    
    view.dodo.style.label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    
    let buttonTintColor = DodoColor.fromHexString("#FFFFFF90")
    view.dodo.style.leftButton.tintColor = buttonTintColor
    view.dodo.style.rightButton.tintColor = buttonTintColor
    
    view.dodo.style.bar.animationShow = currentShowAnimation.show
    view.dodo.style.bar.animationHide = currentHideAnimation.hide

    addButtons()
    
    view.dodo.show(message)
  }
  
  private func addButtons() {
    view.dodo.style.leftButton.icon = nil
    view.dodo.style.rightButton.image = nil
    
    if leftButtonSwitch.on {
      // Use a built-in icon
      view.dodo.style.leftButton.icon = DodoIcons.Close
      view.dodo.style.leftButton.accessibilityLabel = "Close"
      view.dodo.style.leftButton.hideOnTap = true
    }
    
    if rightButtonSwitch.on {
      // Use custom image
      let customImage = UIImage(named: "Dodo.png")
      view.dodo.style.rightButton.image = UIImage(named: "Dodo.png")
      view.dodo.style.rightButton.size = CGSize(width: 30, height: 30)
      view.dodo.style.rightButton.image = customImage
      view.dodo.style.rightButton.tintColor = nil
      view.dodo.style.rightButton.accessibilityLabel = "Dodo"
      
      view.dodo.style.rightButton.onTap = { [weak self] bar in
        self?.rotateTheView()
      }
    }
  }
  
  private func rotateTheView() {
    let myCALayer = view.layer
    
    myCALayer.shouldRasterize = true
    myCALayer.rasterizationScale = UIScreen.mainScreen().scale
    
    var transform = CATransform3DIdentity
    transform.m34 = -1.0/300.0
    myCALayer.transform = CATransform3DRotate(transform, CGFloat(0), 0, 1, 0)
    
    SpringAnimation.animate(myCALayer,
      keypath: "transform.rotation.y",
      duration: 3.0,
      usingSpringWithDamping: 0.7,
      initialSpringVelocity: 0.7,
      fromValue: Double(0),
      toValue: Double(2 * M_PI),
      onFinished: nil)
  }
  
  // MARK: - Change animation
  
  @IBAction func onShowAnimationButtonTapped(sender: AnyObject) {
    currentShowAnimationIndex += 1
    if currentShowAnimationIndex >= animations.count { currentShowAnimationIndex = 0 }
    updateShowAnimationButtonTitle()
    show()
  }
  
  @IBAction func onHideAnimationButtonTapped(sender: AnyObject) {
    currentHideAnimationIndex += 1
    if currentHideAnimationIndex >= animations.count { currentHideAnimationIndex = 0 }
    updateHideAnimationButtonTitle()
    show()
  }
  
  private func updateShowAnimationButtonTitle() {
    let text = currentShowAnimation.rawValue
    showAnimationButton.setTitle(text, forState: UIControlState.Normal)
  }
  
  private func updateHideAnimationButtonTitle() {
    let text = currentHideAnimation.rawValue
    hideAnimationButton.setTitle(text, forState: UIControlState.Normal)
  }
  
  var currentShowAnimation: DodoAnimations {
    return animationForIndex(currentShowAnimationIndex)
  }
  
  var currentHideAnimation: DodoAnimations {
    return animationForIndex(currentHideAnimationIndex)
  }
  
  private func animationForIndex(index: Int) -> DodoAnimations {
    if index >= (animations.count - 1) { animations[0] }
    return animations[index]
  }
}

