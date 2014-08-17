#! /bin/bash
BACKUP_DIR='/var/backups/etc/'
TODAY="${BACKUP_DIR}$(date +%Y%m%d)"
YESTERDAY="${BACKUP_DIR}$(date -d '-1 day' +%Y%m%d)"

if [[ -d "${TODAY}" ]]; then 
	echo "${TODAY} already exist"
else
	mkdir -p "${TODAY}"
	echo "copy etc to ${TODAY}"
	cp -r /etc/* "${TODAY}"

	if [[ -d "${YESTERDAY}" && $(diff -r "${TODAY}" "${YESTERDAY}" 2> /dev/null | wc -l) == 0 ]]; then
		echo "on change and rm ${YESTERDAY}"
		rm -rf "${YESTERDAY}"
	fi

fi






