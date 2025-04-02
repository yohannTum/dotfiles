#!/bin/bash

mkdir -p ~/logs

############################# clip.out #############################
echo "INIT (ls -l /tmp) : -- $(date)" >> ~/logs/clipboard_daemon.sh.log
ls -l /tmp >> ~/logs/clipboard_daemon.sh.log

if [[ ! -p "/tmp/clip.out" ]]; then
	# Making sure to delete anything than a pipe before creating one
	echo "Creating clip.out pipe init... -- $(date)" >> ~/logs/clipboard_daemon.sh.log
	rm -rf /tmp/clip.out
	mkfifo "/tmp/clip.out"
fi

OUTPUT () {
	while true; do
		if [[ ! -p "/tmp/clip.out" ]]; then
			echo "Creating clip.out pipe inside while loop... -- $(date)" >> ~/logs/clipboard_daemon.sh.log
			rm -rf /tmp/clip.out
			mkfifo "/tmp/clip.out"
		fi
		xclip -selection clipboard -o > /tmp/clip.out
	done
}

OUTPUT &
output_pid=$!
# echo "output_pid (outside): ${output_pid}"
while ./clipnotify/clipnotify -s clipboard; do
	# echo "killing : ${output_pid}..."
	kill $output_pid
	# empty the pipe
	cat /tmp/clip.out > /dev/null
	OUTPUT &
	output_pid=$!
	# echo "output_pid (inside): ${output_pid}"
done &

############################# clip.in #############################
if [[ ! -p "/tmp/clip.in" ]]; then
	echo "Creating clip.in pipe init... -- $(date)" >> ~/logs/clipboard_daemon.sh.log
	rm -rf /tmp/clip.in
	mkfifo "/tmp/clip.in"
fi

echo "END (ls -l /tmp) : -- $(date)" >> ~/logs/clipboard_daemon.sh.log
ls -l /tmp >> ~/logs/clipboard_daemon.sh.log

while :; do
	# This won't be killed, only 'kill -s SIGTERM 0' will...
	# cat /tmp/clip.in | xclip -q -loops 1 -selection clipboard
	cat /tmp/clip.in | xclip -selection clipboard
done

# kill $(jobs -p)
# kill -s SIGTERM 0
