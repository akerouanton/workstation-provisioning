#!/bin/sh

set -o nounset
set -o errexit
set -o pipefail
[[ "${TRACE:-}" != "" ]] && set -o xtrace

icon='display-brightness'
urgency='low'
expire_time=3

function take_action {
	case "$1" in
		'+')
			xbacklight -inc $2;;
		'-')
			xbacklight -dec $2;;
	esac
}

function gen_progressbar {
    local bar_size="$1" # The total number of items(the width of the bar)
    local current="$2" # The current progress status in percent
    local filled_item="#" # The look of a filled item 
    local not_filled_item="-" # The look of a not filled item

    # calculate how many items need to be filled and not filled
    local nb_filled_items=$(python -c "print(int(${current} * ${bar_size} / 100))")
    local nb_not_filled_items=$(python -c "print(${bar_size} - ${nb_filled_items})")

    # Assemble the bar string
    local filled_items="$(python -c "print(\"${filled_item}\" * ${nb_filled_items})")"
    local not_filled_items="$(python -c "print(\"${not_filled_item}\" * ${nb_not_filled_items})")"
    echo "${filled_items}${not_filled_items}"
}

function send_notification {
    local backlight=${1}
    local progress="$(gen_progressbar 10 "${backlight}")"

    dunstify \
        --appname=Backlight \
        --hints=string:x-canonical-private-synchronous:backlight \
        --urgency=low \
        --icon=notification-display-brightness-full \
        "Backlight: ${backlight}%" "${progress}"
}

take_action $1 $2
send_notification $(xbacklight -get | grep -o '[0-9]*' | head -n1)
