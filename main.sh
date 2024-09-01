#!/bin/bash

se1() {
  read -p "> " qh
  case $qh in
     1)
        echo "sim"
        mkdir -p "yad"
        echo "eu acho que eu criei a pasta..."
        echo "{name:"", lifes:10}" > "yad/user.json"
        if [[ -r "yad/name.txt" ]]; then
          echo "ok, já existe a data."
          home
        else
          echo "não existe."
          res
        fi
        ;;
     *)
        echo "por favor, digite uma resposta certa."
        se1
        ;;
  esac
}

res() {
  echo "mas... vamos à aventura!"
  echo "qual é seu nome?"
  read -p "> " nome
  echo "olá $nome, vamos começar a aventura!"
  sleep 1
  echo "espera, só deixa eu colocar aqui os comandos..."
  echo "yes" > "yad/ifg.txt"
  ifp=$(cat "yad/ifg.txt")
  echo "$ifp"
  echo "esse é a coisa."
  sleep 1
  echo "vou colocar os comandos."
  sleep 2
  clear
  home
}

home() {
  echo "olá $nome, bem-vindo à aventura!"
  echo "eu vou salvar seu nome."
  if [[ ! -r "yad/name.txt" || -r "yad/name.txt" ]]; then
    echo "qual é sua comida preferida?"
    echo "1) pizza"
    echo "2) McDonald's"
    ok
  fi
}

ok() {
  read -p "> " qh
  case $qh in
    1)
      echo "pizza não é muito gostoso..."
      echo "mas desculpe por te xingar :("
      read -r
      echo "... e agora?"
      read -r
      echo "a gente pode jogar?"
      read -r
      echo "que legal!"
      read -r
      game
      ;;
    2)
      echo "McDonald's não é uma boa escolha para muitos."
      echo "Vamos jogar assim mesmo!"
      read -r
      game
      ;;
    *)
      echo "Escolha inválida."
      ok
      ;;
  esac
}

game() {
  echo "vamos jogar o jogo do carro!"
  echo "tutorial: digite cima, baixo, esquerda e direita para se mover"
  read -r
  echo "não bata nos carros!"
  read -r
  clear
  echo "🚗🚗"
  echo "3"
  sleep 1
  echo "2"
  sleep 1
  echo "1"
  sleep 1
  echo "vai!"
  echo "pressione enter para pular um frame."
  echo "🚗"
  echo "  🚗"
  read -p "> " qh
  if [[ $qh == "cima" ]]; then
    clear
    echo "🚗🟩🟩"
    echo "🟩🟩🟩"
    echo "combustível: 100%"
    echo "digitação desabilitado."
    sleep 2
    clear
    text1="🚗🟩🟩"
    text2="🟩🟩🟩"
    text3="combustível=99%"
    echo "$text1"
    echo "$text2"
    echo "$text3"
    read -p "> " qh
    if [[ $qh == "cima" ]]; then
      clear
      echo "🚗🚗🟩"
      echo "🟩🟩🚗"
      echo "combustivel: 98%"
      echo "velocidade: 20 km/h"
      echo "uma dica: você pode digitar baixo para fugir."
      read -p "> " qh
      if [[ $qh == "baixo" ]]; then
        clear
        echo "🟩🟩🚗"
        echo "🚗🟩🟩"
        echo "você é o de baixo."
        echo "o jogo travou e você venceu."
      elif [[ $qh == "cima" ]]; then
        clear
        echo "🚙🚗🟩"
        echo "🟩🟩🚗"
        echo "agora você é o azul."
        read -p "> " qh
        if [[ $qh == "cima" ]]; then
          clear
          echo "você chegou na linha de chegada."
        fi
      else
        clear
        echo "você quebrou o carro."
        echo "1)reniciar 2) sair"
        read -p "> " qh
        se2
      fi
    else
      clear
      echo "o carro foi destruído por: mega_bunitao555"
      echo "1) reniciar 2) sair"
      se2
    fi
      
    
  else
    clear
    echo "você bateu no carro!"
    echo "selecione:"
    echo "1) reiniciar"
    echo "2) sair"
    se2
  fi
}

se2() {
  read -p "> " qh
  case $qh in
     1)
        echo "reiniciando..."
        game
        ;;
     2) 
        echo "obrigado por jogar!"
        echo "eu acho que foi difícil para você jogar..."
        ;;
     *)
        echo "Opção inválida."
        se2
        ;;
  esac
}

echo "Olá! Seja bem-vindo!"
sleep 1
read -r
echo "Esse é um jogo de aventura. Um jogo seu!"
echo "1) O que??!"
se1