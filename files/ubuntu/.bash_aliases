alias c=composer
alias d=docker
alias dc=docker-compose

alias xclip="xclip -selection clipboard"
alias irsii='irssi -n NiR-'
alias pcat='pygmentize -g'
alias pless='LESSOPEN="|pygmentize %s" less -r'
alias ssh-proxy="ssh -T -N -f -D 0.0.0.0:1080 bastion.knpnet.net"
alias is-proxy="ssh -T -N -f -D 0.0.0.0:1080 isvm"

# git aliases (so even drunk, I can force push 😆)
alias g=git
alias igt=git
alias gt=git
alias gti=git

for temp in $(seq 2500 500 5500)
do
    alias ${temp}K="redshift -O ${temp}K"
done
alias 2200K="redshift -O 2200K"
alias noredshift="redshift -O 6500K"
alias killredshift=noredshift
