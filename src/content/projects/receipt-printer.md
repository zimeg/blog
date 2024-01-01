---
title: receipt-printer
desc: a web api for a pos receipt printer
repo: https://github.com/zimeg/receipt-printer
order: 3
---

the simplicity of a receipt printer made for fun hardware to tinker with.

i am currently in search of a new use for it.

## tweet receipt

staying current with my feed used to be a top priority for me.

one of my first python scripts continuously polled the twitter api for tweets
and printed anything new from my feed.

authorization and authentication were unfamiliar challenges and i hardcoded my
tokens.

rate limits were also discovered and my script had to be adjusted to only check
for updates every few minutes.

figuring out how to print on windows was another challenge but i eventually
figured that out.

## teaching computing

the fascination of converting digital to physical remained with me.

my group in the "teaching computing" course set up a simple web server that
printed the request `body`.

this was a decent exercise for explaining the basics of programming and the
request model of the web.

all of the students were successful in printing something!

![a web request to the receipt printer](/code/receipt-printer/request.png "*printer sounds*")
