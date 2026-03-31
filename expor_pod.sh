#expor pod - service
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

#visite o arquivo dry-run.sh e gere o pod como o comando manda

#apague o pod
kubectl delete -f pod-template.yaml

#modificando o pod-template
kubectl run meu-nginx --image nginx --port 80 --dry-run=client -o yaml > pod-template.yaml
kubectl create -f pod-template.yaml

#cria um service
kubectl expose pod meu-nginx

#teste basico
kubectl port-forward svc/meu-nginx 8080:80

#extra - apagar td
kubectl get all

kubectl get pod,service

kubectl get pod,svc

kubectl delete -f pod-template.yaml
kubectl delete service nginx
kubectl delete -f pod-template.yaml
kubectl delete service meu-nginx