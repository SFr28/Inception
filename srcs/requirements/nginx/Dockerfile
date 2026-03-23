FROM debian:bookworm

WORKDIR /nginx

RUN apt-get update -y ; apt-get install nginx -y \
    && apt-get clean
#a la creation du docker, on verifie les updates de nginx, on dit yes automatiquement si besoin (-y) et on installe

RUN mkdir -p /etc/nginx/ssl ; apt -y install openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/OU=42/CN=sfraslin.42.fr/UID=sfraslin"
#genere un certificat ssl em precisant le type du certificat, zapper le mdp demande, dire ou on stocke le certificat et la cle et ajouter des infos pour le certif

COPY conf/nginx.conf /etc/nginx/nginx.conf
#copie le fichier de configuration de nginx 

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# docker build -t nginx . = build un container docker en precisant son nom et depuis le dossier actuel
# docker image ls -t nginx = connaitre les images actuelles
# docker run nginx = demarrer une image ; avec -it = ouvre le terminal du container a son lancement
# docker ps = connaitre les containers actuellement lances ; avec -a =  ajoute les dockers stoppes