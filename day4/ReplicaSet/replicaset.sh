#basico de replicasets
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

#aplique o deployment
kubectl apply -f deployment-d4.yaml

#verifique os replicasets
kubectl get replicasets

#escale para 3 replicas
kubectl scale deployment nginx-deployment-d4 --replicas=3

#após isso altere para 3 replicas direto no yaml
#aplique
kubectl apply -f deployment-d4.yaml

#altere a versao do nginx para 1.19.2
#aplique

#verifique novamente os replicasets
kubectl get replicasets

# NAME                             DESIRED   CURRENT   READY   AGE
# nginx-deployment-d4-799ddf4864   0         0         0       12m
# nginx-deployment-d4-89f7c7b6c    3         3         3       44s

#o antigo replicaset permanece no cluster caso seja necessario fazer um rollback

#veja mais detalhes

# Conditions:
#   Type           Status  Reason
#   ----           ------  ------
#   Available      True    MinimumReplicasAvailable
#   Progressing    True    NewReplicaSetAvailable
# OldReplicaSets:  nginx-deployment-d4-799ddf4864 (0/0 replicas created)
# NewReplicaSet:   nginx-deployment-d4-89f7c7b6c (3/3 replicas created)

#faça o rollback
kubectl rollout undo deployment nginx-deployment-d4

#se verificar as replicasets e o deployment é possível notar a mudança

