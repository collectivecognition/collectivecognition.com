---
layout: post
---
I've been experimenting with setting up an <a href="https://www.archlinux.org">arch linux</a> work environment on my laptop this weekend and one of the things I found myself missing almost immediately from OSX was the handy-dandy built in screenshot functionality.

In the spirit of open source, I whipped up a quick lua key-binding for <a href="http://awesome.naquadah.org/">awesome window manager</a>.

Just place the following in an apppropriate place in your `~/.config/rc.lua` file:

	awful.key({ modkey, }, "p", function () awful.util.spawn_with_shell("FILENAME=/tmp/$(date +%m-%d-%y-%H-%M-%S).png; import -window root \"$FILENAME\"; gimp \"$FILENAME\"") end)

You'll need <a href="http://www.imagemagick.org/">imagemagick</a> to take the actual screenshot and <a href="http://www.gimp.org/">gimp</a> to view / edit it.

Install them like so:

	sudo pacman -S imagemagick gimp

You can restart `awesome` by pressing `mod4-shift-r`, by default.

Now just press `mod4-p` and a screenshot of your current view will auto-magically be opened in gimp.
