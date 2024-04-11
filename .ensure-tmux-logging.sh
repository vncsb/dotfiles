#!/usr/bin/env bash

TMUX_LOGGING_SCRIPTS_DIR="$HOME/.tmux/plugins/tmux-logging/scripts"
CURRENT_DIR="$TMUX_LOGGING_SCRIPTS_DIR"

source "$TMUX_LOGGING_SCRIPTS_DIR/variables.sh"
source "$TMUX_LOGGING_SCRIPTS_DIR/shared.sh"

confirm_logging()
{
  display_message "Logging already happening to ${logging_full_filename}"
}

start_pipe_pane() {
	local file=$(expand_tmux_format_path "${logging_full_filename}")
	"$CURRENT_DIR/start_logging.sh" "${file}"
	display_message "Started logging to ${logging_full_filename}"
}

stop_pipe_pane() {
	tmux pipe-pane
	display_message "Ended logging to $logging_full_filename"
}

# returns a string unique to current pane
pane_unique_id() {
	tmux display-message -p "#{session_name}_#{window_index}_#{pane_index}"
}

# saving 'logging' 'not logging' status in a variable unique to pane
set_logging_variable() {
	local value="$1"
	local pane_unique_id="$(pane_unique_id)"
	tmux set-option -gq "@${pane_unique_id}" "$value"
}

# this function checks if logging is happening for the current pane
is_logging() {
	local pane_unique_id="$(pane_unique_id)"
	local current_pane_logging="$(get_tmux_option "@${pane_unique_id}" "not logging")"
	if [ "$current_pane_logging" == "logging" ]; then
		return 0
	else
		return 1
	fi
}

# starts/continue logging
ensure_pipe_pane_on() {
  if is_logging; then
    set_logging_variable "logging"
    confirm_logging
  else
    set_logging_variable "logging"
    start_pipe_pane
  fi
}

main() {
	if supported_tmux_version_ok; then
		ensure_pipe_pane_on
	fi
}
main
