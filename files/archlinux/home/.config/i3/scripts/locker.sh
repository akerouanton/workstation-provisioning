#!/bin/sh

pkill xautolock

exec xautolock \
  -detectsleep \
	-time 3 \
	-locker "i3lock -d -i ~/Pictures/bg-lock-screen.png" \
	-notify 30 \
	-notifier "notify-send -u critical -t 10000 -- 'Locking screen in 30 seconds'"
