#!/bin/bash
#!/usr/bin/php
hosts=("teste" "teste" "teste" "teste")
hostSelec=("Localhost" "Ambiente Remoto")
echo "Bem vindo ao Inicializador de Ambiente by Gustavisk"

echo "Localhost ou Ambiente Remoto?"
select opt in "${hostSelec[@]}"; do
    case $opt in
        "Localhost")
            hostSit=1
        break
            ;;
        "Ambiente Remoto")
            hostSit=2
        break
            ;;
        "Sair")
            echo "Usuário saiu"
        exit
            ;;
            *)
        echo "Opção invalida $REPLY";;
    esac
done

echo $hostSit
if [ $hostSit != 1 ]; then
    echo "Selecione o host: "
    select fav in "${hosts[@]}"; do
        case $fav in
            "teste")
                echo "teste"
                host="teste"
            break
                ;;
            "teste")
                echo "teste"
                host="teste"
            break
                ;;
            "teste")
                echo "teste"
                host="teste"
            break
                ;;
            "teste")
                echo "teste"
                host="teste"
            break
                ;;
            "Sair")
                echo "Usuário saiu"
            exit
                ;;
                *)
            echo "Opção invalida $REPLY";;
        esac
    done
else
    host="127.0.0.1"
fi

    validatePort(){
        echo "Digite a porta desejada: "
        read porta
    }

 while true; do
    validatePort
    size=${#porta}

    if [[ "$porta" == "" ]];
    then
        echo "Porta não pode ser nulo!"
        exit
    fi

    if ! [[ "$porta" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]
    then
        echo "Deve ser somente numeros!"
        exit
    fi

    if [[ "$size" > 4 || "$size" < 4 ]];
    then
        echo "Deve possuir 4 caracteres!"
        exit
    fi

    break
done

echo "Deseja rodar o optimize:clear?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
        doOptimize=true
        break;;
        No )
        doOptimize=false
        break;;
        *)
        echo "Opção invalida $REPLY";;
    esac
done

echo "Deseja rodar o route:cache?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
        doRouteCache=true
        break;;
        No )
        doRouteCache=false
        break;;
        *)
        echo "Opção invalida $REPLY";;
    esac
done

if  [[ $doOptimize == true && $doRouteCache == true ]]; then
          php artisan optimize:clear
          php artisan route:cache
          php artisan serve --host=$host --port=$porta

    elif [[ $doOptimize == true ]]; then
         php artisan optimize:clear
         php artisan serve --host=$host --port=$porta

    elif  [[ $doRouteCache == true ]]; then
         php artisan route:cache
         php artisan serve --host=$host --port=$porta

else
     php artisan serve --host=$host --port=$porta
fi
