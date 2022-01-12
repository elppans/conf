#!/bin/bash

## Copiar comando para /usr/bin e dar perissão de execução
## Adicionar em /etc/crontab:

# Executar script para o backup automático No horario determinado
#00   23  *  *  *  root /usr/bin/disk_bancobackup.sh

PASTA='/mnt/Backup_Zanthus'

if mount | grep -e "$PASTA" >> /dev/null ; then
        #echo -e "$PASTA"
        ZeusBD -bkp -bdir "$PASTA"
        BKP=`date +%Y%m%d_%H%M%S`
        echo -e "Backup OK - $BKP" | tee /tmp/"$0".log
  else
        BKP=`date +%Y%m%d_%H%M%S`
        echo -e "Não foi possível fazer o Backup - $BKP" | tee -a /tmp/"$0".log
fi
