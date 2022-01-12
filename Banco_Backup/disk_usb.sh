#!/bin/bash
CMD="$(basename "$0")"

## Copiar comando para /usr/bin e dar perissão de execução
## Adicionar em /etc/crontab:

# A cada 1 minuto, verificar HD Externo, se (des)montado no local configurado
#*/1   *  *  *  *  root /usr/bin/disk_usb.sh

DEVUSB=`file /dev/disk/by-path/* | grep -v "broken symbolic link" | grep usb | awk '{print $5}' | sed "s/'//" | cut -d '/' -f '3' | head -1`

PARTUSB=`fdisk -l /dev/"$DEVUSB"  | grep -v 'Disk' | grep "$DEVUSB" | awk '{print $1}'`

PASTA='/mnt/BANCOBACKUP'

#echo -e "
#DEVUSB: "$DEVUSB"
#PARTUSB: "$PARTUSB"
#PASTA: "$PASTA"
#"
#read -p "..."

if  mount | grep "$PARTUSB"| grep "$PASTA" >> /dev/null ; then
        echo "Dispositivo "$PARTUSB" ja foi montado em "$PASTA""
  else
	umount "$PARTUSB" >> /dev/null
	echo "Montando dispositivo "$PARTUSB"..."
        mkdir -p "$PASTA"
        mount "$PARTUSB" "$PASTA"
if  mount | grep "$PARTUSB"| grep "$PASTA" >> /dev/null ; then
        echo "Dispositivo "$PARTUSB" foi montado no diretorio "$PASTA""
 else
        #echo  -e ""$PARTUSB" "$PASTA""
        BKP=`date +%Y%m%d_%H%M%S`
        echo "Não foi possível montar o dispositivo "$PARTUSB"! - "$BKP"" | tee /tmp/"$CMD"_err.log
fi
fi
