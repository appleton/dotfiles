# Add rbenv directory to PATH
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
# Add binstubs directory to PATH to avoid bundle execing everything
export PATH=.bundle/binstubs:$PATH
