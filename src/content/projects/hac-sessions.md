---
title: hac-sessions
description: a browser extension to sustain gradebook sessions
repo: https://github.com/zimeg/hac-sessions
order: 1
---

grades for my assignments in high school were posted to [open source learning
management software][moodle].

convenience of the internet allowed access to these grades any time through a
site called the "home access center".

being a nerd motivated by numbers this site was a popular one for me.

![the web store demonstration for the extension](/code/hac-sessions/store.png "design is my passion")

## an annoying problem

sessions only persisted for around thirty minutes without any activity. then any
active logins were revoked.

having a tab constantly opened in the background to check for updates made this
feature annoying.

remembering to click a button to renew the session once every thirty minutes
seemed like a process better left to the computer.

## bloating a solution

i searched quickly for a solution to click a named button on the page and
stumbled upon [a stack overflow answer][stackoverflow] recommending jquery.

finding the browser apis complex i decided this was alright and wrote a script
to click a button on a timer:

```js

function sessionClicker() {
	$("button[name='session-renew']").click();
}

setInterval(sessionClicker, 30000);
```

even with questionable line breaks the script was small. only 116 bytes. but the
necessary dependency was over 700x larger, at ~84600 bytes.

no concerns were given as i was most excited to have a working script.

## publishing software

sharing this solution with fellow students was a next step for the script.

packaging the script into a chrome extension was enticing but frustrating as i
wanted the script to run only on one domain.

permissions and settings were eventually found and a logo was drawn.

version 1.0 was ready enough to distribute [on the chrome store][webstore]!

![a poorly drawn logo for the extension](/code/hac-sessions/logo.png "digital software made by hand")

### an inspired side note

there was a fellow hacker in my class – @geooot – who found out how to store
sessions and scrape the site data to present it in [a mobile app][graded].

this was incredibly cool.

## removal notice

my failure to comply with the changing chrome store policies meant the extension
could no longer be supported.

in april 2023 it was removed from the chrome web store.

only a handful of downloads were made and a few active users remain.

i am sorry for this violation and hope you can forgive me @google.

![the chrome store removal notice](/code/hac-sessions/removal.png "a regretful removal")

[graded]: https://geooot.com/graded/
[moodle]: https://moodle.com
[stackoverflow]: https://stackoverflow.com/a/9696633
[webstore]: https://chromewebstore.google.com/detail/adbgiopemndfofbajinlgmibolgcfcga
