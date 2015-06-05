🔨🔨🔨 This is work in progress 🔨🔨🔨

# A notification bar for iOS written in Swift

This is a UI widget for showing notification messages in iOS apps.

* It has built-in style presets for common types of messages: success, info, warning and error.
* The bar can have buttons with custom tap handlers.
* Bar styles can be customized.
* Includes customizable animations for showing and hiding the bar.

<img src='https://raw.githubusercontent.com/exchangegroup/Dodo/master/Graphics/alices_adventures_in_wonderland.png'
width='300' alt="Dodo, from  Alice's Adventures in Wonderland" >


> At last the Dodo said, `EVERYBODY has won, and all must have prizes.'

From *Alice's Adventures in Wonderland*.

## Usage

### Show notification bar


```Swift
view.dodo.success("Everybody has won and all must have prizes.")
view.dodo.info("Extinction is the rule. Survival is the exception.")
view.dodo.warning("This world is but a canvas to our imagination.")
view.dodo.error("The perception of beauty is a moral test.")

```

**Note**: if there is an existing notification bar in a UIView it will be replaced by the new one.

<img src='https://raw.githubusercontent.com/exchangegroup/Dodo/master/Graphics/presets/success.jpg'
alt='Dodo success presets' width='414'>

<img src='https://raw.githubusercontent.com/exchangegroup/Dodo/master/Graphics/presets/info.jpg'
alt='Dodo info presets' width='414'>

<img src='https://raw.githubusercontent.com/exchangegroup/Dodo/master/Graphics/presets/warning.jpg'
alt='Dodo warning presets' width='414'>

<img src='https://raw.githubusercontent.com/exchangegroup/Dodo/master/Graphics/presets/error.jpg'
alt='Dodo error presets' width='414'>

### Hide notification bar

```Swift
view.dodo.hide()
```

### Styling

```Swift
view.dodo.style.label.color = UIColor.whiteColor()
view.dodo.style.label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
view.dodo.style.bar.backgroundColor = DodoColor.fromHexString("#00000090")
```