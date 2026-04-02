#lista de comandos uteis do k8s
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

# verificando o kubectl

kubectl version

#verificar os nós do cluster executando
kubectl get nodes

# Nó -> é uma maquina de trabalho, gerenciado pelo control plane
#contem os serviços para executar os pods

#infos detalhadas sobre os nós
kubectl get nodes -o wide

#verificar namespaces
kubectl get namespaces

#namespaces -> forma de dividir os recursos do cluster em grupos virtuais
#isolamento logico

#verificando os pods de um namespace especifico
#ex: kube-system

kubectl get pods -n kube-system

#exibir detalhes de um nó especifico
kubectl describe node NODE_NAME 
