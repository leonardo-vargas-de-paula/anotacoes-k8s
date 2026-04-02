#basico sobre deployments
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

#criando deployment com 3 replicas do nginx

nano deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: k8s-demo
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.21
        ports:
        - containerPort: 80

#aplique o manifesto
kubectl apply -f deployment.yaml

#verificar se o deployment foi criado
kubectl get deployments -n k8s-demo

#verificar os pods
kubectl get pods -n k8s-demo -l app=nginx

#escalar o deployment
kubectl scale deployment nginx-deployment --replicas=5 -n k8s-demo

#visualizar historico

kubectl rollout history deployment nginx-deployment -n k8s-demo
