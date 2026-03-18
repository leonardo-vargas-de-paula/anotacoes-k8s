#criando um pod
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

#criar um namespace
kubectl create namespace k8s-demo

#pod.yaml
nano pod.yaml #pode ser outro nome

apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  namespace: k8s-demo
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80

#aplicando o manifesto
kubectl apply -f pod.yaml

#verificando status do pod
kubectl get pods -n k8s-demo #-n <namespace>

#inspecao detalhada
kubectl describe pod nginx-pod -n k8s-demo

#verificando logs
kubectl logs nginx-pod -n k8s-demo

#acessar o pod
kubectl exec -it nginx-pod -n k8s-demo -- /bin/bash

#verificar se o servidor esta funcionado (dentro do pod)
curl localhost:80



