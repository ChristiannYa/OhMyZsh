# Based on bira theme

setopt prompt_subst

() {
local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{#cc7832}%n%f'
  PR_USER_OP='%F{#cc7832}%#%f'
  PR_PROMPT='%F{#cc7832}➤ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{#cc7832}%m%f' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{#9DACBF}@${PR_HOST}"
local current_dir="%B%F{#cc7832}%~%f%b"
local git_branch='$(git_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

PROMPT="%F{#cc7832}╭─%f${venv_prompt}${user_host} ${current_dir} \$(ruby_prompt_info) ${git_branch}
%F{#cc7832}│ %D{%m/%d/%y %I:%M:%S %p}%f
%F{#cc7832}╰─%f$PR_PROMPT %F{#96d460}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"
}
