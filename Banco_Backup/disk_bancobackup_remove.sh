#!/bin/bash

## Copiar comando para /usr/bin e dar perissão de execução
## Adicionar em /etc/crontab:

# Executar Script para limpeza de backups antigos, de "N" dias ou mais, configurado na variável "DIAS", no horario determinado.
#00   2  *  *  *  root /usr/bin/disk_bancobackup_remove.sh

DIAS='3'
PASTA='/mnt/Backup_Zanthus'

if mount | grep -e "$PASTA" >> /dev/null ; then
        #echo -e "$PASTA"
	ZeusBD --remove-backup -d "$DIAS" -D "$PASTA" | tee /tmp/"$0".log
	BKP=`date +%Y%m%d_%H%M%S`
	echo -e "$BKP" | tee -a /tmp/"$0".log
  else
	BKP=`date +%Y%m%d_%H%M%S`
	echo -e "Não foi possível Executar limpesa - $BKP" | tee /tmp/"$0".log
fi

