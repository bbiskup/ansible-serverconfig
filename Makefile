provision_fast:
	# no apt update
	ansible-playbook -i inventory/ playbook_provisioning.yml -e"refresh_apt=false"  --vault-password-file ~/.vault_pass.py

provision_full:
	ansible-playbook -i inventory/ playbook_provisioning.yml --vault-password-file ~/.vault_pass.py


gather_logs:
	ansible-playbook -i inventory/ playbook_gather_logs.yml 

test_delegate_to:
	# must ask sudo password for bb with current settings
	ansible-playbook -i inventory/ playbook_experiments.yml -K

only_sentry:
	# no apt update
	ansible-playbook -i inventory/ playbook_sentry_server.yml --vault-password-file ~/.vault_pass.py

restart_sentry:
	ansible -i inventory/ sentry_servers -m shell \
		-a"supervisorctl restart sentry:sentry-web && supervisorctl restart sentry:sentry-worker" -s

only_godev:
	# no apt update
	ansible-playbook -i inventory/ playbook_godev.yml 

apt_upgrade:
	time ansible -i inventory/ all -m shell -a"apt-get update; apt-get upgrade -y" -s

backup_home:
	time ansible -i inventory/ all -m shell -a"duply home backup" -s	
