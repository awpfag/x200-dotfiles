c(){
	clear
}

DISABLE_AUTO_TITLE="true"
#autocomplete
autoload -U compinit promptinit
compinit
promptinit
setopt COMPLETE_ALIASES
fpath=(/usr/local/share/zsh-completions $fpath)

#history
HISTFILE="$HOME/.config/zsh/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

#theme
zstyle ':completion:*' menu select
PROMPT=" %B%~ $ "

#keybinds
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
        autoload -Uz add-zle-hook-widget
        function zle_application_mode_start { echoti smkx }
        function zle_application_mode_stop { echoti rmkx }
        add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
        add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# delete useless folders that keep appearing in ~/
[ -d "$HOME/Desktop" ] && rm -rf $HOME/Desktop
[ -d "$HOME/Downloads" ] && rm -rf $HOME/Downloads
[ -d "$HOME/.lyrics" ] && rm -rf $HOME/.lyrics

#aliases
alias ytdlmp3='yt-dlp -x --audio-format mp3'
alias ytdl='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'
alias sx='startx ~/.config/.xinitrc'
alias ls='ls --color=auto'
alias wgetdir='wget -r -np -R "index.html*"'
alias poweroff='doas poweroff'
alias reboot='doas reboot'
alias git-key='xclip ~/documents/git-key -selection clipboard'
alias update='doas emaint sync -a'
alias upgrade='doas emerge -auDN @world'
alias cleanup='doas emerge -a --depclean'

export PATH="/sbin:/usr/sbin/:$PATH"
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
c
