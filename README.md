.zshenv - Should only contain user’s environment variables.
.zprofile - Can be used to execute commands just after logging in.
.zshrc - Should be used for the shell configuration and for executing commands.
.zlogin - Same purpose than .zprofile, but read just after .zshrc.
.zlogout - Can be used to execute commands when a shell exit.

We need to replace macOS default zsh with Homebrew's. We do this like so:
- `which zsh`
- `/bin/zsh`
- dscl . -read /Users/$USER UserShell
- UserShell: /bin/zsh
We need to replace the shell to Homebrew
- sudo dscl . -create /Users/$USER UserShell /opt/homebrew/bin/zsh