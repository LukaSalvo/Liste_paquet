# Gestionnaire de paquets interactif (Ruby) — Asahi Linux

Ce script Ruby permet de **lister, rechercher, mettre à jour ou supprimer** facilement des paquets installés sur **Asahi Linux**, que ce soit via `dnf` ou `brew`.

## 🚀 Fonctionnalités
- Détection automatique du gestionnaire de paquets (`dnf` ou `brew`).
- Liste complète des paquets installés (`rpm -qa` pour DNF, `brew list` pour Homebrew).
- Recherche interactive par début ou fragment de nom.
- Possibilité de :
  - 🔄 **Mettre à jour** un paquet.
  - 🗑 **Supprimer** un paquet.

## 🧰 Prérequis
- Ruby installé (`ruby -v` pour vérifier)
- Gestionnaire de paquets supporté :
  - `dnf` (par défaut sur Asahi Linux)
  - ou `brew` (si tu l’as installé)
- Droits `sudo` pour la mise à jour ou la suppression via DNF

## 📦 Installation

1. Clone ou copie le projet :
   ```bash
   git clone https://github.com/ton-compte/Liste_paquet.git
   cd Liste_paquet
   ```

2. Rends le script exécutable :
   ```bash
   chmod +x package_manager.rb
   ```

3. Exécute-le :
   ```bash
   ./package_manager.rb
   ```

## 🖥 Exemple d’utilisation

```
💡 Tape le début du nom d’un paquet :
> python

📦 Paquets trouvés :
1. python3.11-3.11.4-1.fc40.aarch64
2. python-libs-3.11.4-1.fc40.aarch64

Choisis un paquet (numéro) : 1

Que veux-tu faire avec 'python3.11-3.11.4-1.fc40.aarch64' ?
1. 🔄 Mettre à jour
2. 🗑 Supprimer
> 2
🗑 Suppression de python3.11-3.11.4-1.fc40.aarch64...
```

## 🧪 Compatible avec
- **Asahi Linux** (Fedora / RPM)
- **Homebrew** sur macOS ou Linux

## 📝 Auteur
Projet créé par un étudiant passionné d’informatique sous Asahi Linux, pour simplifier la gestion des paquets depuis le terminal.

---
© 2025 — Libre d’utilisation à des fins éducatives.
