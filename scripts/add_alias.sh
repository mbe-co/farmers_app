#!/bin/bash

# a funcao sera executada para cada um destes arquivos
files=(.bashrc .zshrc)

for f in ${files[@]}; do
  filename="$HOME/$f"

  if [ -f $filename ]; then
    # verifica se o path já foi exportado antes
    if ! $(grep 'farmers_app/scripts' $filename &>/dev/null);
    then

      # pula linha
      echo >> $filename

      # escreve um comentario sobre o que sera adicionado
      echo '# farmers_app script' >> $filename

      # adiciona ao path o caminho com os scripts
      echo "export PATH=\"\$PATH:$(pwd)/scripts\"" >> $filename
    fi
  fi
done

echo "Agora execute: source ~/.bashrc ou ~/.zshrc"
