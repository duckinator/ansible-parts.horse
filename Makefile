all:
	@echo "Usage: make HOSTNAME"
	@echo
	@echo "Where HOSTNAME is the hostname of the system you want to set up."

vars/secrets.yml:
	@echo "No vars/secrets.yml found!"
	@echo
	@echo "Copy vars/secrets.yml.example to vars/secrets.yml and fill it out,"
	@echo "then re-run this command."
	@echo
	@exit 1

%:
	$(MAKE) run DOMAIN="$@"

run: vars/secrets.yml
	ansible --version
	@echo
	ansible-playbook -i "$(DOMAIN)," playbook.yml

.PHONY: all run
