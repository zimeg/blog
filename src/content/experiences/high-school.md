---
organization: frisco high school
title: independent study
order: 1
---

my high school had computer science classes and an independent study program.

these were both so fundamental to sparking my interest in computers and
complemented my preferred learning style so well.

## computer science courses

i took my first computer science class in my sophomore year and learned the
basics of programming. this included variables and data types, if statements,
loops and functions, and even arrays!

### my first program

writing "hello world" in java was my gateway into programming. the school
computers thankfully had a java environment configured but i still remember
encountering a compilation error on my first day.

when copying from a reference slide, i ended up with the following:

```java
class HelloWorld {
    public static void main(String[] args) {
        System.out.printIn("hello world!");
    }
}
```

but this mysteriously wouldn't work!

it took a class of debugging to realize `printIn` should be `println`. after
fixing this, i finally made my computer talk and it was thrilling.

the rest of the year remained thrilling as
[we wrote many small games][minesweeper]. coding also became more enjoyable as
my debugging skills improved.

### the advanced placement test

as a junior i took the advanced placement class to prepare for the college
board advanced placement test ^(tm). 

many object oriented concepts were covered but my teacher was more focused on
motivating our learning so we continued to build games.

i also started to dabble in web development on the side and as part of the
[independent study program][ism].

whatever score i got on the test was enough for some college credit.

### senior year studies

on the third year of instruction with my teacher, mr. kaufman, i had earned
the privilege of exploring my own projects during class time.

this time was used almost exclusively for developing the site i was building in
independent study. i would also help classmates with java problems sometimes.

having a chance to freely explore interesting problems and concepts made
learning addicting.

thank you for all of your instruction mr. kaufman.

![presenting a display board of my work from independent studies to my teacher](/code/high-school/kaufman.png "the student tries to explain software development to the computer science teacher")

## independent study and mentorship

the independent study program provided a self-guided curriculum to explore any
topic of interest with the help of a mentor.

for me this meant building websites. websites were the most familiar tool i had
for solving problems with a computer.

putting something on the internet was also a cool concept.

### mentorship

so much of my learning was guided by my mentor, mr. grevshmuel.

we met on a regular basis to discuss concepts and plan a product roadmap. this
is where i was introduced to relational databases, apis, open source, and the
agile methodologies.

having professional guidance from a professional was fantastic. it made concepts
approachable for an otherwise clueless student.

### projects

the websites i built ran on linux with apache and used mysql with php.

the full stack was available to me and i was excited to learn it. i eagerly
bought a book on the lamp stack with an outdated version of php and tried to
build something.

#### apply digital

my first project was an attempt to convert applications for the independent
study program from physical to digital.

most of the complexity revolved around requesting letters of recommendation and
linking the responses to an application.

but scope creep swallowed me early as i tried to generalize form creation
instead of just creating a simple form:

![a simple landing page with options to create, continue, or start applications](/code/high-school/apply-digital.png "a snapshot of a site that attempted to do too much without doing much at all")

progress was also slower than ideal as i was learning the basics of web
development while developing.

accidentally deleting my production and development environment was no help.
neither was a lack of version control.

so much was left to be desired after many sprints of long nights and working
through other classes.

#### netflix buddies

following another iteration of "apply digital" the next year, i became
interested in adding a social layer to netflix.

i was also interested in tracking the watch times for shows i watched.

these interests were joined in a website that collected
[show data from an api][omdb] and a chrome extension that relayed watch
statistics back to my server:

![review and rating forum for the show black mirror](/code/high-school/netflix-buddies.png "each passing day brings us closer to the realities of this great show")

possible improvements were plentiful but on some level this project was a
success!

i considered inviting reed hastings to the presentation for this site.

### lessons

exploring these very engaging topics made learning so exciting for me.

beyond technical skills there were personal realizations also realized.

difficulty focusing on scoped problems without inviting scope creep,
overestimating capabilities and overpromising results, and finding the
completion stage are only a few examples.

thank you for your guidance and patience as i learned, coach goff and mr.
grevshmuel.

[ism]: #independent-study-and-mentorship
[minesweeper]: https://github.com/zimeg/minesweeper
[omdb]: https://www.omdbapi.com
