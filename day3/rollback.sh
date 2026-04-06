#rollback de atualização
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

#alterar o deploymeny para

image: nginx:1.15.0

# aplique e verifique depois

# agr, vamos voltar ele para a versao anterior
kubectl rollout undo deployment nginx-deployment

#visualizar o historico do deployment
kubectl rollout history deployment nginx-deployment

#visualizar um historico especifico
kubectl rollout history deployment nginx-deployment --revision=<numero>

# fazer rollback para um historico especifico
kubectl rollout undo deployment nginx-deployment --to-revision=<numero>

#pausa o deployment e n permite nenhuma att
kubectl rollout pause deployment nginx-deployment

#despause
kubectl rollout resume deployment nginx-deployment

#reinicia o deployment
kubectl rollout restart deployment nginx-deployment

# para delete pode usar delete normal
#se for pelo manifesto eh delete -f

