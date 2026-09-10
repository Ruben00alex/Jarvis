0:00

0 seconds

I've moved the majority of my dev work off of my MacBook and onto my framework desktop. And what I kind of want to talk about here is the reason for actually

0:08

8 seconds

setting up a Linux box and why Linux in 2026. What my devices and physical setup for all of this actually looks like. The

0:16

16 seconds

way I connect all my devices together, the way I actually manage these devices from this Mac because I'm not actually directly using this every day. And of

0:24

24 seconds

course, you know, how am I actually getting work done with this? I think the best place to start is probably with the physical framework itself. This thing I got actually the reverbed version of it.

0:36

36 seconds

There was a really good deal on this a couple weeks ago. I'm not sure if it's still up. I'll have it on screen and link below if it is. Basically, you get a full framework desktop that is

0:44

44 seconds

technically refurbished, but I mean mine came in like perfect condition. I've been very happy with it. The big thing it was actually missing was the actual fan that it needs for the CPU and an

0:53

53 seconds

NVME drive for the actual storage. And this is the 64 gigs of RAM spec with the AI plus Ryzen CPU. I'll have it up on

1:02

1 minute, 2 seconds

screen. I don't remember off the top of my head. The point is the performance on this thing is just insane. It shreds through all of the work that I've thrown at it. I have had basically zero issues.

1:11

1 minute, 11 seconds

This thing is awesome. Let me show you real quick how I have this stuff actually hooked up dayto-day. So, as I said, I don't actually use this thing directly. It's in my home server. I

1:19

1 minute, 19 seconds

typically have this thing just kind of uh sitting up here. I just have it plugged in, hooked up to my Switch, and I do actually have an HDMI and USBC

1:28

1 minute, 28 seconds

cable on it. The whole reason for that is actually because of these two guys right here. These are GLI net KVMs. It's

1:36

1 minute, 36 seconds

basically a full remote desktop that operates like a native desktop. It's great. The point is, this is a serverside machine. My setup here is

1:44

1 minute, 44 seconds

definitely overkill for most people. You really just kind of need to have this thing plugged in somewhere hooked into your network and then you can kind of just set it up from there. Since I just

1:52

1 minute, 52 seconds

plugged this thing back in, I will show you the little GLInet KVM thing I have.

1:58

1 minute, 58 seconds

I'm just using this like a normal computer just through the browser. It's so convenient. And what's really nice about this is it has built-in tail scale support. We'll talk about tail scale in

2:06

2 minutes, 6 seconds

a second because it's the only way this system actually works. The KVM itself is actually on my TailNet. So even if I'm not at home, I can still remotely access

2:15

2 minutes, 15 seconds

the computer. If there's something weird where it's not super easy to deal with over CLI, I can just go into the guey, manage it there. Now, I have all these

2:22

2 minutes, 22 seconds

devices hooked together, but how do I actually like manage and set all this stuff up? So, like I mentioned earlier, Tailscale is kind of the backbone of

2:30

2 minutes, 30 seconds

this entire thing. If you haven't set it up yet, I highly recommend it. It is a lot of things, but the thing I use it for, which is entirely on their free

2:36

2 minutes, 36 seconds

tier, actually, is just the ability to effectively VPN all of your devices together on a pseudo LAN. so that my

2:45

2 minutes, 45 seconds

MacBook here is on the same LAN quote unquote as my actual Linux machines.

2:50

2 minutes, 50 seconds

That then allows me to SSH into it, run arsync on it, and also allows agents to easily just slide in and do stuff on it.

2:57

2 minutes, 57 seconds

It's also very useful for if I have something hosted and running on one of those machines, it can expose an actual like website or something like that and

3:04

3 minutes, 4 seconds

then I can just go to that website on this machine. A great example of this is T3 Code. Nowadays, I do a ton of my work in here, but not through the desktop

3:12

3 minutes, 12 seconds

app, just the browser. I go to this URL on my tail net that is the T3 code instance. I can just open it in the browser. This works at home and also

3:20

3 minutes, 20 seconds

anywhere else I am because again tail scale connects all this stuff together.

3:24

3 minutes, 24 seconds

But then the actual like management side of this is pretty much entirely handled by agents. I did a lot of work to make sure this was as easy for them to handle

3:32

3 minutes, 32 seconds

as possible. Pretty much when you're setting up new devices, all you really need to do is just open up codecs on both machines and be like, "Okay, I need

3:40

3 minutes, 40 seconds

to be able to SSH between these two anytime from an agent. Can you just get that set up for me?" It'll walk you through it and get it all working. You should definitely pay attention to how

3:48

3 minutes, 48 seconds

it's doing it and make sure it happens correctly. I have this private project on my machine that's basically my personal config for my agents and also

3:56

3 minutes, 56 seconds

my fleet of devices on my private network. There's a bunch of skills in here that most of these don't matter too much for this video. The really important one here is actually the

4:04

4 minutes, 4 seconds

network skill. This is the skill that defines all of the devices I have. Like anytime I mention another device or my network or tail scale or something like

4:12

4 minutes, 12 seconds

that, it'll call this skill and get all the context it needs to know how to interface between these things. The big reference here is the devices.mmd file.

4:20

4 minutes, 20 seconds

It just has a big list of all of the devices that exist on my tail nets that I work with day-to-day. This defines what their name is, what the tail scale

4:29

4 minutes, 29 seconds

domain is, what the purpose is, the SF LAAN IP, which is just my local network IP, the tail scale IP, and then whenever I mention one of these devices by name,

4:37

4 minutes, 37 seconds

it knows what that is, knows how to connect to it, can send the stuff over, makes life so much easier. Without having something like this, you would have to constantly explain what the

4:44

4 minutes, 44 seconds

devices are or maybe rely on the memory system. Neither of those feel good.

4:48

4 minutes, 48 seconds

Putting in the effort to make the custom skills for this and also really read them and make sure they look good and correct. Don't just let the agents blindly write skills. Makes a huge

4:57

4 minutes, 57 seconds

difference. I have some other stuff in here that I find quite useful like my babysit PR skill, make PR skill, make plan skill, new change in workry skill,

5:06

5 minutes, 6 seconds

like all these little things for just how I do my day-to-day work. Since I have that all defined within this project, there's instructions in here so

5:13

5 minutes, 13 seconds

that when a new device gets set up, all of these skills are loaded onto it. It also loads up the T-Mox config that I use to remote into devices. Like if I go

5:20

5 minutes, 20 seconds

into my terminal here and I SSH into my framework here. It'll take a moment to boot. And you'll notice that as soon as I SSH in, I haven't done anything. I just plugged it back in. It'll

5:28

5 minutes, 28 seconds

automatically drop me into a T-Mox instance with the name of the device, the date, a nice color showing which device it is. I have all these

5:36

5 minutes, 36 seconds

colorcoded so like if I'm inside of the box that does all my Hermes agents, that'll be an orange and this one is a red. It's just convenient for keeping track of what's actually happening. And

5:45

5 minutes, 45 seconds

since I'm using T-Mox for all of these, if I fire up a cloud code session in here, send off some work, and then close this connection or something, it won't

5:53

5 minutes, 53 seconds

stop the work. It'll keep running on that machine no matter what. Cuz that's really the big benefit you're getting here. It's basically just a big private

6:00

6 minutes

dedicated instance that you have running 24/7 to do whatever work you want. It's a great system, but it does require a

6:08

6 minutes, 8 seconds

lot of setup and effort to get working right. And if you don't want to go through all that setup and work, you should use today's sponsor, which is, funny enough, Cursor. I've wanted to

6:16

6 minutes, 16 seconds

work with Cursor for a long time. And yeah, we all know what Cursor is and does. But a lot of what they used to do has very much changed. They now have the

6:25

6 minutes, 25 seconds

best remote setup out of the box of anything I've used. Their cloud environments are pretty much second to none. You can see right here, I have one up and running right now. And this is

6:33

6 minutes, 33 seconds

actually in the Cursor Desktop app. But you'll notice that down here at the bottom it says cloud. That's because all of this work is happening on a cloud

6:40

6 minutes, 40 seconds

instance that is dedicated for this thread. Every time you spin up a new thread in the cursor cloud agents that creates effectively a perfect work tree

6:49

6 minutes, 49 seconds

that is an independent copy of the codebase running on its own doing its own thing and you can spin up as many of these as you want at once with no

6:56

6 minutes, 56 seconds

hardware limitations at all. It just works which is an incredibly powerful way to parallelize a ton of different work. You can see up here at the top when I actually booted this environment

7:05

7 minutes, 5 seconds

it took less than 300 milliseconds. And now that it's up and running, the agent is off doing its thing. I have a live desktop view here that I could take

7:13

7 minutes, 13 seconds

control of to actually see what it's doing on the box. I also can go in here to the inapp browser. This is running on localhost on my machine because it has port forwarding automatically set up.

7:22

7 minutes, 22 seconds

And on 5173, I can see the preview of the site on this machine. If I go into my browser, go to localhost 5173. There

7:30

7 minutes, 30 seconds

it is. And this isn't running on my machine. This is running on the cursor cloud agent box. It's such a powerful way to get work done. And even though I

7:37

7 minutes, 37 seconds

do have my home server setup, which I use a ton, I also find myself reaching for this pretty consistently for a lot of projects, especially since you can

7:45

7 minutes, 45 seconds

easily just send off changes from the desktop app, the mobile app, or even from Grockbot. If you somehow haven't already tried Cursor, go to davis7.link/cursor,

7:53

7 minutes, 53 seconds

or just update your cursor instance to latest and try out the cloud agents.

7:57

7 minutes, 57 seconds

Trust me, you will be impressed. And I think that leads me nicely into what I really want to talk about here, which is how I use this to actually get work done. And like I mentioned earlier,

8:06

8 minutes, 6 seconds

these systems are pretty much managed by agents. I will do most of the updates, most of the setup just entirely by opening up Codeex or Claude, telling it,

8:14

8 minutes, 14 seconds

"Hey, go onto this machine, make these changes, go do it now." Does a great job. And it's also a lot of the way I do my work day-to-day. There's this weird

8:23

8 minutes, 23 seconds

thing that we can now do, especially since agents have just gotten so good.

8:27

8 minutes, 27 seconds

that is if you have some work running on your local machine or whatever, often times it's going to run for way longer than you want it to. Sometimes I need to

8:35

8 minutes, 35 seconds

just close my laptop and go somewhere. I don't want to have it open or running. I don't want to do the like caffeinate thing where I close it but it's still running in the background. It's just

8:43

8 minutes, 43 seconds

annoying and weird to set all of this up. I want a dedicated box to send work off to. The cursor system is really good. Every thread gets its own

8:52

8 minutes, 52 seconds

dedicated box. But then there's also the setup that I'm using here, which is the you have your own dedicated instance, which you can just send work off to

9:00

9 minutes

whenever and it's running for you 24/7, not tied to your actual laptop. The laptop at this point for me is mostly just an interface to my other devices

9:09

9 minutes, 9 seconds

and to the work that my agents are doing. I honestly kind of use like the Codex desktop app, not as much for like doing real work, but mostly just for

9:16

9 minutes, 16 seconds

like being the place where I send jobs off to other machines. You can have something going and then if it's taking too long, you just tell the agent, hey,

9:25

9 minutes, 25 seconds

go take all this work, wrap it up, send it over to this machine, get it resumed and running on there and give me the command or prompt that I need to run on

9:33

9 minutes, 33 seconds

that machine to inspect the state. Or even just don't bother with that. And when you come back later, ask in that same thread, hey, can you go check on the status of this work? and then it'll

9:41

9 minutes, 41 seconds

go do that for you. It feels very counterintuitive and weird to do, especially the first few times you do it. But once you get used to this idea that all of your machines effectively

9:50

9 minutes, 50 seconds

operate as one machine and you can just take the work in blobs that are happening from these agents and just stick them wherever you want. It really

9:57

9 minutes, 57 seconds

unlocks a lot of workflows that have made my life a lot easier. A huge portion of this work is just running through T3 code because I think this is

10:05

10 minutes, 5 seconds

honestly the best general setup for a remote agent instance that we currently have right now that is running on your own system. There are better cloud

10:14

10 minutes, 14 seconds

solutions like cursor. But for like running on your own hardware and server, you can kind of get away with this on something like Codeex. They have their

10:21

10 minutes, 21 seconds

remote systems where you can interact with it from the mobile app or from the desktop app. But I find it to be a lot less reliable and it just doesn't feel

10:28

10 minutes, 28 seconds

quite as good. This is overall the one that I prefer using day-to-day for most of my work. And the way you actually work with this when you're remote, there

10:36

10 minutes, 36 seconds

are some parts of it that just kind of feel weird initially, especially the fact that like, okay, if there's a diff, how do I see that in my editor? How do I

10:43

10 minutes, 43 seconds

get that down? Or like, if there's a dev server running, how do I see what it's actually doing? It's a little counterintuitive to not be on your own machine cuz you're so used to working on

10:51

10 minutes, 51 seconds

your own machine. But a lot of these problems are pretty easily solved by just kind of changing the way you prompt the agents and just having them do things a little bit differently. What

10:58

10 minutes, 58 seconds

I'm going to do right here is pull down the latest changes from main, then spin up a dev server version of the web UI, send me a link to actually preview it.

11:07

11 minutes, 7 seconds

So, you can already see here in the trace it's giving out like it's saying that it's going to verify the current get state blah blah blah. But the big thing it's saying here is launch the web

11:15

11 minutes, 15 seconds

UI on the tail scale interface. So, it's going to send me a link in the tail scale format and make sure the dev server is started in such a way that I

11:22

11 minutes, 22 seconds

can get to it remotely. So once it's done all of this and I have that link, I can just open it on this machine even though the actual project is running on

11:30

11 minutes, 30 seconds

that other machine. You kind of just have to get the good mental mapping for how all of these devices fit together and which one you're on. But once you have that, the workflows this unlocks

11:39

11 minutes, 39 seconds

are just so powerful, especially for long running agent tasks. It is so convenient to just send off a job, close

11:47

11 minutes, 47 seconds

the computer, and not think about it all night. It's really, really nice. Another huge benefit that I probably should have talked about earlier is the fact that

11:54

11 minutes, 54 seconds

Linux can handle so much more than Mac OS can. Mac OS and this Mac is a very powerful machine, but the problem is

12:01

12 minutes, 1 second

there are so many things baked into Mac OS that just make it slower. The system will babysit processes and make sure that they're being safe and not causing

12:10

12 minutes, 10 seconds

problems or whatever. But when you're running tons of agents, that can result in a lot of CPU usage just going into things that it shouldn't be, like making

12:18

12 minutes, 18 seconds

sure that it's doing what it's supposed to when you don't actually care all that much. You know what it's doing. The Linux machines don't have this problem.

12:25

12 minutes, 25 seconds

The processes can just run and it's very, very efficient and effective. This is a screenshot from earlier today that I took of my BTOP on the framework

12:34

12 minutes, 34 seconds

desktop that's running right now. The system was doing four massive longrunning jobs, all of which were using a lot of uh visual type things.

12:43

12 minutes, 43 seconds

I'm testing out some stuff with the gold bug puzzles, trying to get a couple different solutions on those. It's doing really heavy work on those. It's writing a bunch of code. It's running in loops.

12:51

12 minutes, 51 seconds

It's using sub aents. There are probably 30 to 40 agents running at once on this machine in the screenshot. And you can

12:58

12 minutes, 58 seconds

see it's like barely hitting the resources. It's really not causing any problems. It feels really fast and snappy. And even when I've gotten this

13:05

13 minutes, 5 seconds

thing like fully loaded up, like I'm hammering all of the cores, which doesn't happen all that often. Even when that does happen, it doesn't impact my day-to-day experience where like this machine isn't getting hit with that.

13:16

13 minutes, 16 seconds

This machine doesn't have those problems. So even if it's lagging a little bit there, I just don't notice or feel it. It's fully offloaded from me.

13:22

13 minutes, 22 seconds

It's one of those things that once you get used to having most of your work run remotely, it's really hard to go back to developing on one machine all the time.

13:31

13 minutes, 31 seconds

There are, of course, some downsides to this. A huge one being the context sharing between them requires some effort and curation. For example, if

13:39

13 minutes, 39 seconds

you're working on a project on your laptop and then that has a bunch of threads associated with it and maybe some nodes spread across the file system. Doesn't always happen, but it

13:48

13 minutes, 48 seconds

does happen sometimes. When you send that work off to another machine or maybe you clone the project down on that other machine, that means that okay, now all that context is missing. Unless when

13:57

13 minutes, 57 seconds

unless maybe you use the agent to send that work over, in which case it can make sure that it grabs all the relevant pieces and has them over there. But

14:04

14 minutes, 4 seconds

still, that's a thing you have to deal with. You also have to deal with environment setup repeatedly. Like if you have files on your main machine,

14:11

14 minutes, 11 seconds

then thosev files have to get over to the remote machine. The safe way to do that is to manually copy them over, but sometimes I'm just lazy and let the agent do it. I've actually moved to

14:20

14 minutes, 20 seconds

using Infysical, which is just like a secrets management platform for a lot of this stuff. Especially since I have a lot of projects that are now running on

14:27

14 minutes, 27 seconds

my Mac, they're running on my Linux boxes, they're running on other cloud hosted agents like the cursor agents. It really makes it easier to just have one dedicated place for the secrets to live.

14:37

14 minutes, 37 seconds

So, you just have to log into the CLI once on each machine. And then once you've done that, it's ready. It's there. And then whenever you have the agent boot up the dev server, it has all

14:45

14 minutes, 45 seconds

of the environment variables that are required to get the project working.

14:48

14 minutes, 48 seconds

There's a lot of things you need to do to get your projects in a state where they make sense for remote development, but once you do, it's great. You also do

14:56

14 minutes, 56 seconds

lose out on some of the more native Mac OS type things like the really good computer used from codecs or just anything involving Xcode and iOS and Mac

15:04

15 minutes, 4 seconds

OS. If you need that for your day-to-day work, you could do a remote setup with like a Mac Mini. It's not going to be quite as powerful as the Linux, but it

15:11

15 minutes, 11 seconds

will unlock those capabilities. So, I do some of that sometimes, but most of the time, if I really need to do some mobile app dev stuff, I'll just do it on this

15:19

15 minutes, 19 seconds

machine. It's not really worth trying to remote that out. But most work for most projects can be done remotely, unless it's very Apple specific. And this

15:26

15 minutes, 26 seconds

thread from earlier just finished. I have the preview URL right here. I just click it. I now have the full dev server up and running on this machine as if it

15:34

15 minutes, 34 seconds

was on this machine, but it's not. I think you get the idea. Let me know what you think. And if you like the video, make sure to like and subscribe.
