function fish_right_prompt --description 'Write out the right prompt'
	[ "$SHOW_RIGHT_PROMPT" = true ] ;or return 0

	set -l color_cwd
	switch "$USER"
		case root toor
			if set -q fish_color_cwd_root
				set color_cwd $fish_color_cwd_root
			else
				set color_cwd $fish_color_cwd
			end
		case '*'
			set color_cwd $fish_color_cwd
	end

	switch "$PROMPT_STYLE"
		case 'min'
			echo ''
		case '*'
			echo (set_color $color_cwd) (prompt_pwd) (set_color normal)
	end
end
