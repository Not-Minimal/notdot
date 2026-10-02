# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/minimal/.docker/bin"
# End of Docker Desktop section.

starship init fish | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end
