# Notes
Alright, so I'm switching from my Development and production environment, to working strictly in the Production copy of my application. This is because I ffeel like the app is working correctly, and any change I make I'll want to push to production, via the HHeroku command line. 

Bbut maybe the thing I should be doing is moving to a new branch. I mean, i can still work in the production environment, but I can work on a differnt bbranch then the master branch. 

And this would be good practice for me working on a different branch. 

I mean, that makes it an even more "production" like environment I feel. Where I'm doing work on a "development" branch in the "production" app. 

So what shoudl I do? I mean, if Robert is doing some work, what can I work on? What should I work on? I mean, there's some basic things. Like Navigation. 

I know that requires working with the views and the layouts....

I mean, if that's something that I want to do, I think I can take the time to do that. And I can explore it as much as I want, because I'm not in a rush to get to production anymnore. Or I'm not in an eternal battle to struggle with getting an application to production. Because as far as I can tell, I ahve one. 

BBut I'd like to continue forward with the tutorial, the getting started application. So I'll do taht. 

Ok, switching to a "dev" branch locally....

## 5.13 Deleting Articles
>..the route for deleting articles as per output of `rails routes` is: 

```
DELETE /articles/:id(.:format)      articles#destroy
```

>The `delete` routing method should be used for routes that destroy resources. 

What? the `delete` routing method should be used for routes that destroy resources. I don't really know what that means specifically, but it makes some sense to me. Just keep going. 

>if this was left as a typical `get` route, it could be possible for people to craft malicious URLs like this: 

```html
<a href="http://example.com/articles/1/destroy">look at this cat!!</a>
```

>I use the `delete` method for destroying resources, and this route is mapped to the `Destroy` method/action inside the `app/controllers/articles_controller.rb` which doesn't exist yet. 

THE Controller exists. What doesn't exist is the `#destroy` method. 

So, yeah, this is like a pre-defined route because it's a resourceful route. I mean, it's available since the controller and/or resource was created, yeah? Something like that. 

So, when were the routes created?  

So back in the `Getting Up and Running` section, there was discussion about the `#resources` method. I didn't realize it was a method at the time, but that's exactly what it was...and that meethod created the routes. 

