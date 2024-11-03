# Étape 1 : Utiliser une image Maven pour la construction
FROM maven:3.8.5-openjdk-17 AS builder

# Définir le répertoire de travail
WORKDIR /tp-foyer
# Copier le fichier pom.xml et le dossier source
COPY pom.xml .
COPY src ./src

# Construire le projet Maven, en évitant les tests pour accélérer la construction
RUN mvn clean package -DskipTests

# Étape 2 : Utiliser une image OpenJDK pour exécuter l'application
FROM openjdk:17-jdk-alpine

# Exposer le port de l'application
EXPOSE 8089

# Copier le fichier .jar construit depuis l'étape de construction
COPY --from=builder /app/target/tp-foyer-5.0.0.jar tp-foyer-5.0.0.jar

# Spécifier la commande à exécuter lors du démarrage du conteneur
ENTRYPOINT ["java", "-jar", "/tp-foyer-5.0.0.jar"]
