### Создание SSH ключа для github

ssh-keygen -t ed25519 -C "<email>"
ssh jenkins@158.160.49.248
ssh-keygen -t ed25519 -C "sbitza@gamil.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

Копируем в буфер публичный ключ и добавляем его в github


