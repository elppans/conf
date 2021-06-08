# Backup automático

Scripts para ZeusRetail

Adicionar os Scripts em seus respectivos locais e configurar para ser executado pelo crontab

##	CRONTAB

```
# A cada 1 minuto, verificar HD Externo, se (des)montado no local configurado
#*/1   *  *  *  *  root /usr/bin/disk_usb.sh

# A cada 1 minuto, verificar Compartilhamento, se (des)montado no local configurado
*/1   *  *  *  *  root /usr/bin/pathcomum_serv # Executar pathcomum_serv a cada 1 MIN.

# A cada 1 minuto, verificar Compartilhamento para backup, se (des)montado no local configurado
*/1   *  *  *  *  root /usr/bin/rede_bancobackup.sh # Executar rede_bancobackup.sh a cada 1 MIN.

# Executar script para o backup automático No horario determinado
00   23  *  *  *  root /usr/bin/disk_bancobackup.sh

# Executar Script para limpeza de backups antigos, de 3 dias ou mais, no horario determinado
00   2  *  *  *  root /usr/bin/disk_bancobackup_remove.sh

```

> Para usar estes Scripts, deve instalar/atualizar o ZeusBD:

https://github.com/elppans/zretail/raw/master/ZeusBD-7.2.0.tgz

Restartar serviço Crontab:

CentOS 6:

service crond restart

CentOS 7:

systemctl restart crond.service
