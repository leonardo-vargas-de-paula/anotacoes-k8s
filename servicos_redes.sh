#basico sobre servicos e redes
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

#criando deployment com 3 replicas do nginx

#criando um contexto - usado no tutorial dessa forma para definir um namespace padrao
kubectl config set-context lab --namespace=servicos-lab
kubectl config use-context lab

kubectl config get-contexts #validar


