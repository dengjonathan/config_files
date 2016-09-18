# set default path
export PATH=$PATH:/Google\ drive/Programming

#user bins
export PATH=$PATH:$HOME/bin

# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"


# Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
   export EDITOR=/usr/bin/subl

   alias cp='cp -iv'                           # Preferred 'cp' implementation
   alias mv='mv -iv'                           # Preferred 'mv' implementation
   alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
   alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
   alias less='less -FSRXc'                    # Preferred 'less' implementation
   cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
   alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
   alias ..='cd ../'                           # Go back 1 directory level
   alias ...='cd ../../'                       # Go back 2 directory levels
   alias .3='cd ../../../'                     # Go back 3 directory levels
   alias .4='cd ../../../../'                  # Go back 4 directory levels
   alias .5='cd ../../../../../'               # Go back 5 directory levels
   alias .6='cd ../../../../../../'            # Go back 6 directory levels
   alias edit='atom'                           # edit:         Opens any file in sublime editor
   alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
   alias ~="cd ~"                              # ~:            Go Home
   alias c='clear'                             # c:            Clear terminal display
   alias which='type -all'                     # which:        Find executables
   alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
   alias show_options='shopt'                  # Show_options: display bash options settings
   alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
   alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
   alias cd_p='cd ~/Google\ Drive/Programming' #cd into my Programming folder

   # git aliases
   alias gs='git status '
   alias ga='git add '
   alias ga.='git add . '
   alias gl='git log'
   alias gh='git hist'
   alias gb='git branch '
   alias gc='git commit'
   alias gd='git diff'
   alias gdh='git diff HEAD '
   alias gpom='git push origin master'
   alias go='git checkout '
   alias gk='gitk --all&'
   alias gx='gitx --all'
   alias got='git '
   alias get='git '
   alias gcp='git_commit_push.sh'
   alias gread='git add README.md && git commit -m "updated README"'

   #Node aliases
   alias lyn='stream-adventure'
   alias lynv='stream-adventure verify program.js'
   alias lynr='stream-adventure run program.js'

   #Install Pomander
   alias isl-pom='curl -s https://raw.githubusercontent.com/reactorcore/pomander/master/bin/install | bash'

   #go to hack_reactor folder
   alias cd_hr='cd ~/Google\ Drive/Programming/hack_reactor'
   alias init_sprint='sprint_workflow.sh'

   #node stuff
   alias no='node'
   alias no_dbg='node-inspector'

   #npm stuff
   alias npm-i='npm install'
   alias npm-save='npm install --save'
   alias npm-dev='npm install --save-dev'
   alias mknode='mkdir node_modules'

   #   cdf:  'Cd's to frontmost window of MacOS Finder
   #   ------------------------------------------------------
       cdf () {
           currFolderPath=$( /usr/bin/osascript <<EOT
               tell application "Finder"
                   try
               set currFolder to (folder of the front window as alias)
                   on error
               set currFolder to (path to desktop folder as alias)
                   end try
                   POSIX path of currFolder
               end tell
   EOT
           )
           echo "cd to \"$currFolderPath\""
           cd "$currFolderPath"
       }

# added by Anaconda2 2.5.0 installer
export PATH="/Users/jonathandeng/anaconda/bin:$PATH"


export NVM_DIR="/Users/jonathandeng/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# put this in your .bash_profile
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

# Piece-by-Piece Explanation:
# the if condition makes sure we only screw with $PROMPT_COMMAND if we're in an iTerm environment
# iTerm happens to give each session a unique $ITERM_SESSION_ID we can use, $ITERM_PROFILE is an option too
# the $PROMPT_COMMAND environment variable is executed every time a command is run
# see: ss64.com/bash/syntax-prompt.html
# we want to update the iTerm tab title to reflect the current directory (not full path, which is too long)
# echo -ne "\033;foo\007" sets the current tab title to "foo"
# see: stackoverflow.com/questions/8823103/how-does-this-script-for-naming-iterm-tabs-work
# the two flags, -n = no trailing newline & -e = interpret backslashed characters, e.g. \033 is ESC, \007 is BEL
# see: ss64.com/bash/echo.html for echo documentation
# we set the title to ${PWD##*/} which is just the current dir, not full path
# see: stackoverflow.com/questions/1371261/get-current-directory-name-without-full-path-in-bash-script
# then we append the rest of $PROMPT_COMMAND so as not to remove what was already there
# voilà!
