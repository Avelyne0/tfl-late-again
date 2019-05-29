# tfl-late-again
an excuse generator using the TFL api



Sam and Jack

Our project is to use the TFL API to generate excuses as to why a user is “late” for work. Our project would make requests to the API to find out where delays are on the lines and return a tailored excuse as to why the user is late. For example, returning a delay on the northern line that would have made the user late for work by a given time.

We would take in the users origin and destination to see the closest delay in proximity to their home or place of work, if there are none or the delay is not significant enough we would then span the search out to find a greater delay, and then if there’s nothing on their line we would make an excuse for them stating they took a route in from a different origin.

Then of course if there are no realistic delays we would just make up an excuse about crossrail.


https://api.tfl.gov.uk/


Enhancements;

Silly and pulpy responses and calls to make the app more interesting, like “Sorry I’m late boss, I was stuck on the Jubilee line because a wild duck took the entire train hostage”

“I’m really sorry I had a doctor’s appointment at ___ and there was a massive delay on the DLR”


During set up of the app, we would have the user provide information as to how much of a hard-ass their boss is (like how much they would care that the user is late), this could then be overridden during the prompt stage.


Further enhancements (pie in the sky);

A rating system for the excuses including how well the excuse was received.


Has many through



Golden Path (MVP)

User opens app.
User recalls their user instance (self.user)
User supplies their line.
App calls TFL API to check for delays.
App response with delays on that line.
Interpolated response with user, line, excuse.


User story -
a user can sign up and log in

as a user I can enter my origin (tube station)

as a user I can enter my destination (tube station)

as a user I am presented with a single tube route that is relavent to my journey in the form of an excuse
if there is a delay I am presented with a relavent delayed line
if there is no delay I am presented with any relavent line

restart or log out

#TO DO
Sam

encapsulate the api calls so they can be called separately and integrate with code much better

find out how to import data to the check methods to first check if
they exist and then fill the fields required if it does

Jack

create a method to findby commonName to get the iscCode in the table for the origin and destination
refactor code





future tasks

create the list of excuse messages
trips table (class methods in Trips etc)







