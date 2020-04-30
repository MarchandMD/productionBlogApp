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

Ok, so back to working on the master branch

So, building requires continuous effort. 

there's more that I want to learn; I think what I want to do is add another page...but adding a page isn't like a straightforward thing. Do I need to add a new controller? I mean, I don't understand why not. 

But how else would I add another page? 

Because there are already some paths that are "built-in" to a controller. 

The only controller I've added so far has been the one for 'Articles'. Now, I'm pretty sure the first thing I did with that was added something to the `config/routes.rb` file. So maybe I need to spend some more time looking at that part of the guide. 

# Rails routing from the Outside In

So, I'm doing this section because I feel like it's important for creating new pages. The way I created a resource was the first step to building a MVC. Perhaps there's a need for me to do the same. 

I mean, what am i doing with the Model? I'm keeping track of blog articles. Adn what is the blog article? It's a form. The form includes two things: a title and thext. 

So if I was going to do the same thing, but for a list of things, what would I do? 

Name of the link, the actual link, maybe a brief description? i think that's it. I mean, whatelse would need to be included? 

So yeah, why not maek it another resource? It's good practice. 

## 1. The Purpose of the Rails Router
>The Rails router recoginzes URLs and dispatches them toa controllers action, or to a Rack applicaiton. 

What's a Rack application? I don't really know and I don't want to know right now. So a URL comes in, and the Rails router sends the URL to a controller action. 

>It can also generate paths and URLs, avoiding the need to hardcode strings in my views. 

Ok, so i htink this is how the route_helpers are involved...and allow me to use route helpers. 

## 1.1 Connecting URLs to Code
>When my Rails aplication receiving an incoming request for: 

```http
GET /patients/17
```

The Rails applicaiton asks the router to match the incoming request to a controller action. 

>if the first matching route is: 

```
get '/patients/:id`, to: 'patients#show`
```

>the incoming reuqest is dispatchted to the `patients` controller's `#show` method/action with `{id: '17'}` in `params`. 

So wait, I don't really understand this. I feel like there's some information that's sort of implicit in all this, and I'm not necessarily grasphing it: 

the point is...there is an incoming requesxt. I'm pretty sure that incoming HTTP request comes from the browser. So this implies a working knowledge of how an HTTP request is made. So then do I need to refresh my understanding of HTTP requests? I mean, I don't feel like I need to right now. I think it's enough to know that an HTTP request is of one of a few types: GET, PUT, POST, PATCH....maybe DELETE? And these are supposed to associate with the CRUD verbs. 

so this request: 

```
GET /patients/17
```

is somehow a complete HTTP request. I don't know enough about what parts of a request are required, and how they're made...but I don't necessarily feel like I need to know. Tackling HTTP right now would be a big task. i wonder if it's looked at as part of TOP. 

It doesn't talk much about HTTP. that's something else eintirely and if I'm intrested in it, I wonder how deep my interest is and if it'll lead me anywhere. 

Back to the rails article; 

## 1.2 Genearting paths and URLs from Code
>I can also genearte paths and URLs. If the above route is modified to be: 

```
get '/patients/id', to: 'patients#show', as: 'patient'
```

>...and my applicaiton contains this conde in the controlletr: 

```
@patient = Patient.find(params[:id])
```

and this in the corresponding view: 

```ruby
<%= link_to 'Patient Record', patient_path(@patient) %>
```

>then the routes will genearte the path `/patients/17`. 

So what the fuck just happened? 

Well, I think we're talking generally about things taht are in the `config/routes.rb` file...I mean, as the article discusses routes, I know that routes for the most part are in the `config/routes.rb` file. Maybe I should take a look at that file? But not right now. I'm sure soon enough. 

So the idea is then, that the route: 

```
get '/patients/id', to: 'patients#show', as: 'patient'
```

would be found in the `/config/routes.rb` file. 

Ok, so, what they're describing here are possible hard coded routes that could be found in the `/config/routes.rb` file. Got it. 

Ok, now that I understand that, what are thye talking about...

So the route in the `config/routes.rb` file would be: 

```
get '/patients/:id`, to: `patients#show`, as: `patient`
```

and then the controller...the actual controller has this code in it: 

```
@patient = Patient.find(params[:id])
```

So...what is this pre-supposing? That the code is just "floating" in the controller somewhere? Or is the idea that the code is actually within a specific action/method? 

I think it's just floating in the controller. 

Because if this is in a view: 

```ruby
<%= link_to 'Patient Record', patient_path(@patient) %>
```

then I know that would create a link, and that link would be the words 'Patient Record'...and I don't know how the link would generate the path, because I woudlnt' konw how the `params` hash is populated with the request. 

Like, why does the router generate the path `/patients/17`? there has to be another assumption here. Yeah, I don't konw...so i don't know what is meant by genearting the path and URL from Code..

## 1.3 Configuring the Rails Router

>the routes for my application or engine live in the file `config/routes.rb` and typically looks like this: 

```ruby
Rails.application.routes.draw do
  resources :brands, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end
 
  resource :basket, only: [:show, :update, :destroy]
 
  resolve("Basket") { route_for(:basket) }
end
```

So, this isn't so much as configuring the router as it is showing an example of what a router might look like. 

## 2. Resource Routing: the Rails Default
Resource routing. Of course. A resource is supposed to be something that is typically kept in a database. That's why all the actions/methods have corresponding HTTP like requests such as index, show, new, edit, create, update, destroy. All these genearlly associate to the various HTTP verbs. Which is why things are though of typically as a database. 

So yeah, a resource is of course somehting that is routed for...that's why it's called resource routing. 

So then, is a link a resource? 

I mean, not really. A link is just a link. That's why I'm looking at adding a different controller. But that's really not necessary. 

So then it goes from working with a resource back to just designing with bootstrap. That's really it. 

that's fine. Just put them on the homepage. 

So, it's not difficult to add a page full of links. 

But what I'm interested in is something called "link previews". 

I found a resource for it: 

## Link Previews: from https://codingislove.com/generate-link-preview-webapp/

### How to get link preview? 
>Developers need link previews when they are developing any social sharing app or any other app that involves sharing links. So let's see how to get them. 

> Link previews are usually generated by fetching the URL and parsing meta tags of the page for title and description and image tags for thumbnails. 

I don't think I really know how to do any of these things. Seriously. 

>this can be done by making basic GET requests to the URL. 

UM, I think I know how to do that. I think...

>This method works when we just want to parse the meta tags and the page is rendered on the server. 

Um, I don't know what the hell this sentence means. 

>If I want to parse description from the content of the apge and the content is rendered client side, then I should use different methods like using a headless browswer to render the page adn fetch data from it. 

>I need a server to fetch data in any of the above mentioned methods. 

So this article points me to using an API. 

And I've used an API before...but it was a little complicated. 

Perhaps I re-visit that, since I have some time and the inclination to do it. 

But first, maybe I look more at the rails guide or the odin project for woring with APIs

Well, I just watched a RailsCast showing how to set up oAuth...but that's not necessarily what I want to be doing. But I did understand a lot of it, and so maybe I do that just to do it? I mean, it's worth knowing, and doing that would definitely help in other places. Like with routes.rb....

I mean, I'm not really finding what I want; What I want to do is I want to get those link previews  

I'm not doing much of anything. I mean, I don't really know exactly what i want to do..and I'm not finding exactly what I'm looking for. And while I may be interested in one thing, it's not the exact thing I'm looking for. So instead of taking my time with that thing,. I'm not spending any time with it. 

So...I think I need to contioue to articulate the idea more. 

Building links was too basic of a thing. So I started looking at link previewing. But that invovles working with an APi or another gem...and I'm not sure I know how to work with those. But I probably do, so I should go ahead and take the leap and look into it. But look into what? I mean,if I do anything it's helpful. 

I know it's not exactly what I want to be doing but it's lead me along a certain path. And it pushes the comfort zone. 

but can I find something more about those link previews....

This makes me want to re-visit that web-planner project...

So, I need to somehow find this bridge between the "event planner" project, and the Rails WebApp. I know generally how to build that event planner...but then I need to konw how to build that in the app. 

but that's not really helping me. 

And just building the list of hyperlinks isn't really taht difficult. 

Just try the oAuth thing. Make a branch. 

