# RedCarpet
So this is a gem I can install that is a library for Markdown processing

So i'm pretty sure this means that I can pass in text, and that text will be rendered as markdown should be rendered

## Installation
```
gem install redcarpet
```

# How to use RedCarpet
>The core of the Redcarpet library is teh `Redcarpet::Markdown` class.

So I take this to mean that somewhere I'll have to create an instance of a `Redcarpet::Markdown.new` class. 

So something like this: 

```ruby
display_text = Redcarpet::Markdown.new()
```

>Each instance of the class....

...in my example, `display_text` is the instance of the `Redcarpet::Markdown` class

>...is attached to a `Renderer` object;

I don't konw what it means for an instance of a class to be "attached" to another object. So keep reading.

>The `Markdown` class performs parsing of a document and uses the attached renderer to generate output. 

So this tells me that the "document"...aka the text written in Markdown....is parsed by the `Markdown` class...and the `Markdown` class has been written for an instance of it to receive a parameter. That parameter is something called a "renderer"...and that's most likely the `Renderer` object that is "attached" to the `Markdown` instance. 

So I guess that means there is perhaps a mixin, or an add-on or a class written within a class. The `Renderer` class is somehow written directly into the `Markdown` class. 

That would be the only way for a class to be only available specifically to an instance of an object. 

I can read more about the `Renderer` object/class in a line or two, but first: 

>The `Redcarpet::Markdown` object is encourage to be instantiated once with the required settings, and reused between parses. 

I just don't understand what this means. Maybe it means that within my Rails application I can write a method/action that instantiates a `Markdown` object just once; 

Now, it's important to identify that it's the `Markdown` object that's doing the "parsing" and the `Renderer` object that's doing the rendering. 

So then, this begs the question: what's the difference between "parsing" and "rendering"? I'm not sure i need a specific answer right now. I'm growing more excited about this gem as I dig into it, so I want to keep going. 

Here's an example:

```ruby
display_text = Redcarpet::Markdown.new(renderer, extensions = [])
```

So this builds on my previous version of the example by adding in the parameters. 

And this is where and why I believe the `Renderer` object is built into `Markdown` class...because somehow the "type" of render is passed into the `Markdown` instance. 

>Here, the `renderer` variable... 

...parameter variable...

>...refers to a `Renderer` object, which inherits from `Redcarpet::Render::Base`. 

So then it's not necessarily that the `Renderer` object is built within the `Markdown` class...it's inherited and lives within the `Redcarpet` object, by way of the inheritance chain of `Redcarpet < Redner < Base`. 

>If the given object has not been instantiated, the library will instantiate the `Renderer` object (is it `Renderer` or `Render`?). 

>Rendering with the `Markdown` object is done through the `Markdown#render` method. 

>....the text to render is passed as an argument to the `Markdown#render` method, and the text being rendered is not stored inside an instance of the `Markdown` object. And this is how "reusability" is encouraged.

Here's another example, this time actually rendering with the `Markdown` instance. 

```ruby
display_text.render("This is *rendered* text")
```

And the entire example would look like this: 

```ruby
display_text = Redcarpet::Markdown.new(renderer, extensions = {})

display_text.render("text to *render* `done like` this!")
```

So this is the basic machinations of rendering/parsing with `Redcarpet gem`. 

So then I'm left with the task of attempting to get the `Markdown` instance into a view. 

So then I'm curious...how am I doing that in the current application I have? 

I believe I'm doing this through the use of instance variables. Though I don't really know. I mean, how can I learn more about this? 

I think if I am to look at the existing classes/controllers and see how they're moving information from the database to the view via the controller would be helpful. 

So I'll start with...the View? What's a piece of infomration, which view has information that's stored in the database? 

Obviously it's one of the "articles" views...so take a look there. 

So, the `app/views/articles/index.html.erb` lists all the articles from the database/model. 

It does this in ERB by making a call to `@articles`....so where is this instance variable coming from? 

It must be coming from the `ArticlesController`...and specifically, which method/action? 

Well, since the view i'm looking at is `index.html.erb` then the method/action that is providing the instance variable is the `#index` action. So what is it then: is it `Articles#index`? or `Article#index`?

Ok, so somehow this controller has these certain routes. 

Now I'm pretty sure I'd need to do a deeper dive of creating routes to understand how to create a rote to use with the `Redcarpet` gem. But no, not really. Because the idea is to do something to the single record...or the single piece of data. So it's not necessariy the index I want to be looking at. I mean, I can get an idea here, but just not the exact thing I'm looking to do. 


So, really, what I'm interested in is the `/show.html.erb` view. 

So where does this instance variable come from? 

Obviously it comes from the ArticlesController, and the `#show` action/method. 

so the individual `@article` comes from the `#show` method, and the individual record is obtained by ggrabbing a parameter. 

So what's next?

Well, in the view is where the text is rendered. But what I want to do is, I want to, within the ERB...is executed the rendering of the markdown thing. Right? 

I mean, where would I want to do this? 

Or...yeah. Becaues I'd simply do it once in the view, and then that would be it. 

Because it's the `@article.text` that would need to be passed to the `markdown.render` method call. like this: 

Oh, I think, maybe in the controller action/method, I could create another instance variable such as `@display_text` and set that equal to the `Redcarpet::Markdown.new(renderer, extensions = {})`, and then I'd be able to, in the ERB, make a reference bboth to the `Markdown` object and also the `@article.text` instance variable. 

so it'd end up looking something like: 

```ruby
def show
  @article = Article.find(params[:id])

  @display_text = Redcarpet::Markdown.new(renderer, extensions = {})
end
```

Would that be possible? Would there be any issues with scope?

I mean, there's only one way really, to learn. 