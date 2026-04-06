#estrategias de atualizaçao de deployments
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

#o k8s tem 2 estrategias de att para deployments:
#Rolling Update e Recreate

#RollingUpdate
#atualiza pods de forma gradual

#Recreate
#mata o pod e cria um novo

#alterar o deployment para:
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: nginx-deployment
  name: nginx-deployment
spec:
  replicas: 10
  selector:
    matchLabels:
      app: nginx-deployment
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1 
      maxUnavailable: 2
  template:
    metadata:
      labels:
        app: nginx-deployment
    spec:
      containers:
      - image: nginx:1.15.0
        name: nginx
        resources:
          limits:
            cpu: "0.5"
            memory: 256Mi
          requests:
            cpu: "0.25"
            memory: 128Mi

#maxsurge = pods extras criados sem definir
            # agiliza o processo de att 
#maxunavailable = pods que podem ficar indisponiveis

#acompanhar status
kubectl rollout status deployment nginx-deployment

#verificar se atualizou
kubectl get pods -l app=nginx-deployment -o yaml

#atualziar o deployment
kubectl apply -f deployment.yaml

#teste com o recreate 
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: nginx-deployment
  name: nginx-deployment
spec:
  replicas: 10
  selector:
    matchLabels:
      app: nginx-deployment
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: nginx-deployment
    spec:
      containers:
      - image: nginx:1.15.0
        name: nginx
        resources:
          limits:
            cpu: "0.5"
            memory: 256Mi
          requests:
            cpu: "0.25"
            memory: 128Mi

#  trocar de volta para
image: nginx:1.16.0