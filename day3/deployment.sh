#basico de deployments
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

#usando de exemplo o deployment2 q esta no mesmo diretorio
#inicialmente assim:
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: nginx-deployment
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-deployment
  strategy: {} #Rolling Update
  template:
    metadata:
      labels:
        app: nginx-deployment
    spec:
      containers:
      - image: nginx
        name: nginx
        resources:
          limits:
            cpu: "0.5"
            memory: 256Mi
          requests:
            cpu: "0.25"
            memory: 128Mi

#criar o deployment
kubectl apply -f deployment2.yaml

#verificar se o deployment foi criado
kubectl get deployments -l app=nginx-deployment #verificando pela label

#verificar os pods q o deployment gerencia
kubectl get pods -l app=nginx-deployment

#verificar detalhes do deployment
kubectl describe deployment nginx-deployment

#alterar um deployment
#inserir as configs:
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: nginx-deployment
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-deployment
  strategy: {}
  template:
    metadata:
      labels:
        app: nginx-deployment
    spec:
      containers:
      - image: nginx:1.16.0
        name: nginx
        resources:
          limits:
            cpu: "0.5"
            memory: 256Mi
          requests:
            cpu: "0.25"
            memory: 128Mi

#atualziar o deployment
kubectl apply -f deployment.yaml
