---
title: unblocked-reddit
description: proxying reddit content with google translate
repo: https://github.com/zimeg/unblocked-reddit
order: 0
---

the network filter my school district used blocked many websites, reddit fairly
being one of them. sometimes wanting to read random threads instead of grind on
an assignment, this hack was tried.

![blobs locked in separate boxes](/code/unblocked-reddit/snoo.png "the front page of the internet")

## the translation trick

at the time, google translate would translate a page given a url. clicking the
translated url impressively showed the page with translated content and also
gave the option to view the original source.

fortunately, google translate was an allowed site so this trick could be used to
proxy page content! this was a widely known cheat to access wikipedia and some
news sites.

unfortunately, remote content was loaded locally and wouldn't load when proxying
content since these urls were still blocked. this meant no images or css and was
almost like reading "inspect element".

## reading reddit

this was problematic for reddit with the amount of styles present so i embarked
on making a small site to improve the reading experience.

with [a url to gather reddit posts in json](https://www.reddit.com/r/askreddit.json)
from a script found online and just enough understanding of html and javascript,
i began turning json into html!

after a few nights of hacking, the end result was a page that could list posts
and gather comments for any subreddit:

![the contents of /r/askreddit in a plain format](/code/unblocked-reddit/askreddit.png "always the same questions on /r/askreddit")

## problems at school

i wasn't aware of the limitations with loading remote content while building
this, so excitedly brought the url to school!

after getting to a computer to try this new page, this limitation became
very clear since none of the reddit content would load. a bummer.

the script for loading all of this content was a javascript file on the client,
so all of these network requests were blocked. i learned then that the same was
true for styles when trying the translation trick.

with this newfound knowledge after a few defeated months, i opened
[my first issue](https://github.com/zimeg/unblocked-reddit/issues/1)
then abandoned the repo.

## open source activity

a few folks in a presumably similar situation later stumbled across the repo
over the following years and would sometimes fork or star it.

no further interaction ever came after that but i remember finding it so cool
that strangers were finding the code useful!

this probably seeded some of my thoughts around sharing code and reminds me that
even unfinished projects can be an energy for others.

here's to sharing more!
