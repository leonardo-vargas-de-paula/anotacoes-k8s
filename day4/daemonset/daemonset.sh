#basico de daemonsets
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: descomplicando k8s

#garante que todos os nós do cluster executem uma réplica de um Pod

kubectl apply -f node-exporter-daemonset.yaml

#verificar pods do daemonset
kubectl get pods -l app=node-exporter

kubectl get pods -o wide -l app=node-exporter

