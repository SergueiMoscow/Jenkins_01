Команды клонирования и запуска (локальный тест)

```bash
if [ -d "Ansible_05" ]; then
  echo "Directory Ansible_05 exists. Performing git pull..."
  cd Ansible_05
  git pull
else
  echo "Directory Ansible_05 does not exist. Cloning the repository..."
  git clone git@github.com:SergueiMoscow/Ansible_05.git
  cd Ansible_05
  python3 -m venv venv
fi
echo "Current directory: $(pwd)"
source venv/bin/activate
pip3 install ansible-dev-tools
pip3 install -U setuptools pip 'molecule'
molecule init scenario default
molecule test
```

cleanWs() (для pipeline) - очищает всё после job.
sso - система авторизации на разных микросервисах
(гиклок???)

openstack - облако

Ставим дополнительно на агента:
```bash
sudo yum install -y epel-release
sudo yum install -y https://repo.ius.io/ius-release-el7.rpm

```