#!/bin/bash

## Copiar comando para /usr/bin e dar perissão de execução
## Adicionar em /etc/crontab:
# */1   *  *  *  *  root /usr/bin/pathcomum_serv.sh # Executar pathcomum_serv a cada 1 MIN.

username=zanthus
password=zanthus
IP='192.168.10.254'
COMPARTILHAMENTO='Public'
PASTA='/mnt/Public254'



#                ! mount | grep "$IP" && \
#        {
#mkdir -p "$PASTA"
#mount -t cifs -o username="$username",password="$password",rw //"$IP"/"$COMPARTILHAMENTO" "$PASTA"
#}

# MOUNT IP
if  mount | grep "$IP" ; then

# MOUNT IP COMPARTILHAMENTO PASTA
if  mount | grep "$IP"| grep "$PASTA" >> /dev/null ; then
        echo "Compartilhamento "$COMPARTILHAMENTO" ja foi montado em "$PASTA""
	exit 0
  else
	#umount //"$IP"/"$COMPARTILHAMENTO" >> /dev/null
	echo "Montando comaprtilhamento "$COMPARTILHAMENTO"..."
	mkdir -p "$PASTA"
	mount -t cifs -o username="$username",password="$password",rw //"$IP"/"$COMPARTILHAMENTO" "$PASTA"
if  mount | grep "$IP"| grep "$PASTA" >> /dev/null ; then
        echo "Compartilhamento "$COMPARTILHAMENTO" foi montado no diretorio "$PASTA""
	exit 0
 else
        #echo  -e ""$PARTUSB" "$PASTA""
        BKP=`date +%Y%m%d_%H%M%S`
        echo "Não foi possível montar o compartilhamento "$COMPARTILHAMENTO"! - "$BKP"" | tee /tmp/disk_usb.log
fi
fi
# MOUNT IP COMPARTILHAMENTO PASTA
  else
	mkdir -p "$PASTA"
	mount -t cifs -o username="$username",password="$password",rw //"$IP"/"$COMPARTILHAMENTO" "$PASTA"
# MOUNT IP COMPARTILHAMENTO PASTA
if  mount | grep "$IP"| grep "$PASTA" >> /dev/null ; then
        echo "Compartilhamento "$COMPARTILHAMENTO" foi montado em "$PASTA""
	exit 0
  else
	#umount //"$IP"/"$COMPARTILHAMENTO" >> /dev/null
	echo "Montando comapartilhamento "$COMPARTILHAMENTO"..."
	mkdir -p "$PASTA"
	mount -t cifs -o username="$username",password="$password",rw //"$IP"/"$COMPARTILHAMENTO" "$PASTA"
if  mount | grep "$IP"| grep "$PASTA" >> /dev/null ; then
        echo "Compartilhamento "$COMPARTILHAMENTO" foi montado no diretorio "$PASTA""
 else
        #echo  -e ""$PARTUSB" "$PASTA""
        BKP=`date +%Y%m%d_%H%M%S`
        echo "Não foi possível montar o compartilhamento "$COMPARTILHAMENTO"! - "$BKP"" | tee /tmp/disk_usb.log
fi
fi
# MOUNT IP COMPARTILHAMENTO PASTA
fi
# MOUNT IP
