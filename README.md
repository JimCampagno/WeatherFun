# Weather Fun - Custom Views

* Swift 3
* Xcode Version 8.0 beta (8S128d)

---

![custom](http://i.imgur.com/JT85pgt.png?1)

This is a **how to** in creating a custom reusable view using XIB's in Interface Builder.
  
I will be creating a XIB file, a class which subclasses from `UIView` along with a model struct that represents a Weather object.


## Instructions


### XIB File


* First, lets create the XIB file. File --> New --> File will present us with this window:

![FirstWindow](http://i.imgur.com/UduLhZO.png?1)

* Select _User Interface_ under the iOS heading on the left and his Next. I named the file `WeatherView`. After doing so, you should see the `WeatherView.xib` file in the navigator pane on the left.
* Select the `WeatherView.xib` file, you should be presented with the following:

![XibView](http://i.imgur.com/LgI70Xp.png?1)


* In the Utilities Menu, which you open up by selecting the right-most button in the top right of Xcode, select the Attributes inspector which will bring up various options.
* Underneath the Simulated Metrics, we want to change the size to freeform:

![freeform](http://i.imgur.com/kCDA0kZ.png?1)

* Now going to the Size Inspector (icon that looks like a ruler next to the Attributes Inspector), I want to set the _Height_ & _Width_ of this View on screen. I'm setting the Width to equal 600 pts, and the Height to equal 300 pts like so:

![HeightAndWidth](http://i.imgur.com/wYIKQ4S.png?1)

* I want to stick to these proportions _even_ though the `UIView` object that will have its Custom Class set to this particular `WeatherView` object might not be 600w x 300h. When I later create this `UIView` object in the `Main.storyboard` file, I will want to stick to these proportions (or make the constraints equal to 600w x 300h to match this). This might not make too much sense now, come back to it when this is all complete.

* Next, you design your view. I've already done the work here (I won't step through how I did it as it's not the point of this blog). You can check out the project [here](https://github.com/JimCampagno/WeatherFun).


![Layout](http://i.imgur.com/SVKwJYv.png?1)

---

### View Class

* Lets create a new Cocoa Touch Class like so:

![NewFile](http://i.imgur.com/gsM69xl.png?1)

* Make sure it's a subclass of `UIView`. I'm naming this view `WeatherView`.

![UIViewSubclass](http://i.imgur.com/IRjwL6m.png?1)

* The contents of your `WeatherView.swift` file should look like this:

![WeatherView](http://i.imgur.com/DaodoP6.png?1)

* Next, I added the following methods:

```swift
import UIKit

final class WeatherView: UIView {
    
    // If someone is to initialize a WeatherView in code
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    // If someone is to initalize a WeatherView in Storyboard setting the Custom Class of a UIView
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        //TODO: Do some stuff
    }
    
}
```

* To take advantage of Static Dispatch (in that this WeatherView class will **NOT** be sublcalssed, I marked it final).
* `init(frame:)` is inherited from `UIView`, WeatherView is subclassed from `UIView`. Here, we're overriding its implementation first calling on `super`'s implementation passing in the `frame` we receive in as  an argument.
* `init?(coder:)` is inherited from `UIView`, but it was marked as required in `UIView`'s implemntation, because of that.. we are required to mark it as required as well. Similar to `init(frame:)` we are first calling on `super`'s implementation passing in the `NSCoder` object we receive.
* You'll notice that both methods just described both call on `commonInit()` which is marked as a private function. Marking it private only allows for people within this particular .swift file (`WeatherView.swift`) to call on this method. This protects us from having this function get called from any other file.

Hopefully, I have your full attention. If not (don't just keep reading). Go back and re-read any sections you glossed over. In making sure you understand this material, it's important that you understand every step of the way.

![TimAllen](https://media.giphy.com/media/1GJJsdST4Ar5u/giphy.gif)

Lets go back to the XIB file for a moment.

---

### Back to the XIB file

* In the WeatherView.xib file, I'm selecting the File's Owner in the left pane like so:

![FileOwner](http://i.imgur.com/JI9MEtX.png?1)

* When File's Owner is selected, take a look in the top right underneath the selected Identity Inspector. Under **Custom Class** we can open the drop down menu under the option Class or type something in that box. Lets set it to our `WeatherView` class file.

![SetupView](http://i.imgur.com/3v2fsPi.png?1)

* Bring up the assistant editor now (I like mine split where I have the code portion at the bottom and the view elements on top):

![AssistantEditor](http://i.imgur.com/Nob5Wqi.png?1)

* Option drag from the `View` seen here in the following screenshot into your code as an Outlet and name it `contentView`.

![view](http://i.imgur.com/7xn1Xpv.png)

* After doing that, setup all of the other `UILabel`'s and `UIImageView` like so:

![outlets](http://i.imgur.com/IaqNdJp.png?1)

* Now we can access these view elements in code! Lets go back to the `WeatherView.swift` file now.

---

### Back to the View Class

* Lets go back to the `WeatherView.swift` and implement the `commonInit()` method that is marked with a TODO.

```swift
private func commonInit() {
        // 1. Load the nib named 'WeatherView' into memory, finding it in the main bundle.
        Bundle.main().loadNibNamed("WeatherView", owner: self, options: [:])
        
        // 2. Adding the 'contentView' to self (self represents the instance of a WeatherView which is a 'UIView').
        addSubview(contentView)
        
        // 3. Setting this false allows us to set our constraints on the contentView programtically
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // 4. Setting the constraints programatically
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
```

* I'm going to touch on 2. for a minute. The .xib file itself contains a `UIView` object (which we've been adding other `UIView` objects to.. the multiple labels and the imageView). The constraints  on those various view elements were made to what is now named `contentView` which is the `UIView` object in the .xib file. But.. here we are inside of `WeatherView` class, which is a sublcass of `UIView` which means it **IS** a `UIView`. Ok.. so we have two separate `UIView`'s here, but we know that the `WeatherView` acts as the **owner** of the `UIView` now named `contentView` in the `WeatherView.xib` file.

![stickwithme](https://media.giphy.com/media/gKsJUddjnpPG0/giphy.gif)

Stick with me.

* Whenever an instance of our `WeatherView` view object is created (whether that be in code or Interface Builder), `commonInit()` will be called on that instance. When that occurs, we load into memory the WeatherView.xib file which hooks up all our outlets as the `WeatherView.swift` file is its owner. Then, we add `contentView` as a subview to `self`, `self` being the newly greated instance of `WeatherView` (again.. that will occur either in code somewhere or in Interface Builder which we will do later). The subview we're adding to `self` here is the `contentView` which contains **ALL** of those view elements we created. But.. how will that `contentView` constrain itself to the view it's now be placed inside of. It doesn't know how to do that so we set the `translatesAutoresizingMaskIntoConstraints` property on the `contentView` to `false` which allows us to programtically create constraints on it. So we do that. We then set the constraints of the `contentView` to equal `self'`s top, bottom, left, and right anchors. That constrains the `contentView` to fit perfectly into `self` (`self` again being the instance of `WeatherView`).

* Lets put this in action.

---

### Storyboad

* To demonstrate how this will work, go to the Main.Storyboard file and drag out a View onto the canvas, like so:

![storyboard](http://i.imgur.com/YI4AQAQ.png?1)


* Here, I'm setting up the constraints of the view we just dragged in like so (making sure to adhere to that 2:1 proportion of constraints we created in the .xib file (600w, 300h) which looking back was a little aggressive. I should have kept the ratio but made it slightly smaller.

![constraints](http://i.imgur.com/6bKcSYB.png)

* Now select that View object that we just added constraints to and open the Identity Inspector like so:

![identityf](http://i.imgur.com/lLafyXC.png?1)

* Set the Class there underneath the Custom Class heading to `WeatherView`

![setuptheview](http://i.imgur.com/AoQsrze.png)

* That's it.

* Build & Run:

![blop](http://i.imgur.com/dynl0CE.png?1)





