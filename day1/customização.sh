nano ~/.zshrc #no zsh
#aliases kubernetes/kubectl
alias k='kubectl'

# Habilitar autocomplete para o alias 'k'
source <(kubectl completion zsh)
complete -F __start_kubectl k
