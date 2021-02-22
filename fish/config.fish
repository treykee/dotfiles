# add Homebrew Python to path
#export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python3/libexec/bin:$PATH"

# add userspace bin to path
export PATH="$HOME/bin:$PATH"

# add /usr/local/bin to path
export PATH="/usr/local/bin:$PATH"

# add virtualenv root to path
#export PATH="$HOME/Virtualenv/*/bin"

# enable iterm2 shell integration
if test -f ~/.iterm2_shell_integration.(basename $SHELL)
    source ~/.iterm2_shell_integration.(basename $SHELL)
end

# set default Vagrant provider
set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion

# set GitHub personal access token for use by Homebrew
set -x HOMEBREW_GITHUB_API_TOKEN 16ae30ed613e5334ea6fc3444e86d10302d389cb

# Command complete for awsr cli tool
test -x (which aws_completer)
and complete --command awsr --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
