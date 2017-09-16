# Ansible

Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs.

## Automating Docker with Ansible

Ansible is the way to automate Docker in your environment. Ansible enables you to operationalize your Docker container build and deployment process in ways that you’re likely doing manually today, or not doing at all.

When you automate your Docker tooling with Ansible, you gain three key things:

### FLEXIBILITY

Ansible Playbooks are portable. If you build a container with a pure Dockerfile, it means that the only way you can reproduce that application is in a Docker container. If you build a container with an Ansible Playbook, you can then reproduce your environment in Docker, in Vagrant, on a cloud instance of your choice, or on bare metal. Plus, you can build your containers up using Ansible Roles, so that even complex container descriptions are easily read, and different container roles can be reused across many environments.

### AUDITABILITY

Ansible Playbooks are repeatable and auditable. Just because containers provide some isolation doesn't alleviate the IT department of the burden of knowing what their containers are based on, tracking any potential vulnerabilities within, and knowing with certainty that you can rebuild a container if needed.

By using Ansible Playbooks to build containers, you gain the advantages of a simple, repeatable, defined state of your containers that you can easily track. Combine this with Ansible Tower and you can easily track who deployed what container, with what code, where and when.

### UBIQUITY

Ansible can manage full environments. With Ansible, you can manage not only the containers, but the environments around the containers. Docker instances still need to run on hosts, and those hosts need to be launched, configured, networked, and coordinated, whether they be local machines or full cloud infrastructures.

Ansible can model containers and non-containers at the same time. This is especially important, as containerized applications are nearly always talking to components — storage, database, networking — that are not containerized, and frequently not even containerizable. And with Ansible Tower, you can deploy your host environments, your containers, and your services with the push of a button.
