#!/bin/bash
set -x

# some ssh sec (disable root login, disable password-based auth):
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
echo "AllowUsers kubeadm" >> /etc/ssh/sshd_config
sed -ri 's/session(\s+)required(\s+)pam_loginuid\.so/#/' /etc/pam.d/sshd

mkdir /var/run/sshd
ssh-keygen -A

# set user's kubeadm env:
useradd -c "Kubernetes admin" -m -G kube,dockerroot kubeadm
SSH_USERPASS=`pwgen -c -n -1 8`
mkdir /home/kubeadm/.ssh -p
echo kubeadm:$SSH_USERPASS | chpasswd
echo kubeadm ssh password: $SSH_USERPASS
#mv /tmp/authorized_keys /home/kubeadm/.ssh/
chown kubeadm:kubeadm /home/kubeadm -R

#chmod 600 /home/kubeadm/.ssh/authorized_keys
chmod 700 /home/kubeadm/.ssh

# set sudo permission for `kubeadm` user to allow him rndc command without pwd:
echo "kubeadm         ALL=(ALL)       NOPASSWD: ALL" >/etc/sudoers.d/kubeadm
