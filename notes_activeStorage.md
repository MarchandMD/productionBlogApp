# ActiveStorage
So these notes are coming from a desire to learn about saving a markdown file, or any file, really, into Rails. 

And by that I mean: I want to save a markdown file into a database, and then serve that record/file to a view, with the markdown notation rendered as it normally would be. 

Since my google search quickly led me back to the guides.rubyonrails.org....I'm going to begin taking notes on this. This is another part of the guide that I geet to look at, and it's like the third this week. 

And it gets me closer to 10am which would allow me to start practicing music. 

## 1. What is ActiveStorage

Before I dig into this section, I'm going to read the table of Contents. 

Ok, so there aren't ToC, but there are a few bullet points about what I will learn. 

1. How to attach one or many files to a record (this is precisely what I was hoping to learn)
2. How to delete an attached file (relevant)
3. How to link to an attached file (also relevant, though my goal is to be able to render the file)

And a number of other bullet points that I'm not too concerned aout or intrested in right now. 

What's a concern though? 

Being able to attach the files into an ActiveRecord model, and not being able to render the file. 

So I guess maybe I want to research taht a little bit...

Hmm, while this may be part of what I want to do, I'm not sure if it'll completely perform the task I'm hoping it will do. 

The second part of what I'm attempting to do is to render the file after it's been saved in the database. So that's something to research before I necessarily dig into ActiveRecord. Though I could still dig into activeRecord superficially.

It seems like it might be better to actually be to do what I already was doing: storing actual markdown as a piece of data in the datatable, and simply rendering that. 

I mean, that way I'm already sort of doing something I've done once before; But I have to figure out how to do it again; This way I'll be able to render something in markdown...or at least the text. 

That's worth a shot. 

so I'm going to put this activeRecord stuff on hold. 