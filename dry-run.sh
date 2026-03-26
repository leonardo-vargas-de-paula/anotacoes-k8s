#uso do dry run
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s


#cria um template
kubectl run meu-nginx --image nginx --dry-run=client -o yaml > pod-template.yaml