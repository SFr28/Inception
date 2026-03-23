
# Inception

**Inception** est un projet de l'école 42 qui consiste à créer un environnement de **déploiement automatisé** utilisant **Docker**. L'objectif est de configurer plusieurs services (Nginx, WordPress, MariaDB) dans des conteneurs Docker distincts, interconnectés via un réseau Docker, et de tout orchestrer avec **Docker Compose**.

---

## 📌 Objectifs
- Comprendre les bases de **Docker** et de la **conteneurisation**. 
- Configurer un serveur web **Nginx** avec SSL/TLS.
- Déployer une application **WordPress** avec une base de données **MariaDB**.
- Automatiser le déploiement avec **Docker Compose**.
- Gérer les volumes Docker pour la persistance des données.


## 🚀 Installation et exécution

1. **Lancer les conteneurs** :
   ```bash
   docker-compose up -d
   ```

2. **Accéder à WordPress** :
   - Ouvrir un navigateur et se rendre à l'adresse : `https://localhost` (ou `https://127.0.0.1`).
   - Accepter le certificat auto-signé (si nécessaire).

3. **Arrêter les conteneurs** :
   ```bash
   docker-compose down
   ```


## 🔧 Configuration

### Variables d'environnement
Le fichier `.env` doit contenir les variables suivantes (exemple) :
```env
DOMAIN_NAME=localhost
DB_NAME=wordpress
DB_USER=user
DB_PASSWORD=password
DB_ROOT_PASSWORD=rootpassword
```

### Certificats SSL
Les certificats SSL auto-signés sont générés automatiquement lors du premier lancement. Ils sont stockés dans le dossier `nginx/certs/`.

---

## 📜 Auteurs

- **Saïna Fraslin**

---

## 💡 Remarques
- Ce projet est réalisé dans le cadre de la formation à l'école 42.
- Les mots de passe et noms d'utilisateur doivent être changés pour un environnement de production.
- Pour réinitialiser complètement l'environnement, utiliser :
  ```bash
  docker-compose down -v
  ```
