# ⚙️ Scripts DevOps & CI/CD – Dossier `03_devops_ci_cd`

Ce dossier contient un ensemble de scripts Shell dédiés aux pratiques DevOps et CI/CD.  
Ils permettent de gérer les images Docker, les déploiements Kubernetes, les releases Git et les dépendances Helm.

---

## 📌 Contenu du dossier

| Script | Fonction |
|--------|----------|
| `docker_image_tag_sync.sh` | Synchronise les tags Docker entre deux images |
| `docker_multiarch_build.sh` | Build multi-architecture Docker et push vers un registry |
| `git_release_tag.sh` | Crée un tag Git pour une release et pousse sur le dépôt |
| `helm_dependency_update.sh` | Met à jour les dépendances d’un chart Helm |
| `k8s_scale_deployment.sh` | Scale un déploiement Kubernetes à un nombre de replicas donné |
| `k8s_secret_generator.sh` | Génère ou met à jour un secret Kubernetes avec des clés/valeurs |

---

## 🔧 Installation

Rendre tous les scripts exécutables :

```bash
chmod +x *.sh
```