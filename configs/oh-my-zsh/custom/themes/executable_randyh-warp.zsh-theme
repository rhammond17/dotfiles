# Kube context
kube_context() {
    foo=`kubectx -c 2>/dev/null`
    if [[ $foo ]]; then
        echo $foo
    else
        echo "NOT SET"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#PROMPT=$'%{$fg_bold[green]%}[%{$fg_bold[magenta]%}%~%{$fg_bold[green]%}]%{$reset_color%} $(git_prompt_info)(%{$fg_bold[yellow]%}$(kube_context)%{$reset_color%})'
PROMPT=$'%{$fg_bold[green]%}[%{$fg_bold[magenta]%}%~%{$fg_bold[green]%}]%{$reset_color%} $(git_prompt_info)%{$fg_bold[yellow]%}$(kube_ps1)%{$reset_color%}'

