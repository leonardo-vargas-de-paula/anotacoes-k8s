#exec e attach
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips/descomplicando k8s

#criando um pod
kubectl run strigus --image nginx --port 81 -n namespace-teste #nao tem resposta se tentar se comunicar via ip

#criando outro pod (busybox eh basico demais, pule esse)
kubectl run garchomp -it --image busybox #busybox precisa do -it
                                         #criei sem o -n pois defini o namespace-teste como default do meu context
                                         #kubectl config get-contexts (ve o contexto)
                                         #kubectl config set-context --current --namespace=namespace-teste (definir o namespace-teste como default do contexto atual)

#criando outro pod (alpine tem o que precisamos)
kubectl run pikachu -it --image alpine  

#veja o ip do strigus em
kubectl get pod strigus -o wide 

#dentro do pod pikachu
apk update
apk add curl
curl <ip do strigus> #funciona, pois esta dentro da rede do cluster
exit

#para entrar de novo
#verifique o nome do conteiner
kubectl describe pods pikachu #procure por containers, é bem facil de achar
kubectl attach pikachu -c pikachu -i -t #-c especifica o conteiner, -it é para definir um terminal interativo
                                        # a police dele é restart always, portanto tem que baixar de novo as coisas

# ja o strigus nao pode ser atacchado pois esta rodando o nginx, e nao um terminal

#eh possivel usar o exec no strigus para rodar o bash
kubectl exec -ti strigus -- bash

