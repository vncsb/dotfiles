local awful = require("awful")

awful.spawn.with_shell(
	'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;'
    .. 'xrandr --output DP-0 --mode 3440x1440 --rate 143.97 --output DP-4 --mode 1920x1080 --rate 144.00 --above DP-0;'
		.. 'xrdb -merge <<< "awesome.started:true";'
		-- list each of your autostart commands, followed by ; inside single quotes, followed by ..
		.. 'picom;'
		.. 'dex --environment Awesome --autostart;'
)
