# Weather Fun

* Swift 3
* Xcode Version 8.0 beta (8S128d)

---

This is a how to in creating a custom reusable view using XIB's in Interface Builder.
  
I will be creating a XIB file, a class which subclasses from `UIView` along with a model struct that represents a Weather object.


## Instructions


* First, lets create the XIB file. File --> New will present us with this window:

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