# 🔒 Scripts Security – Dossier `04_security`

Ce dossier contient un ensemble de scripts Shell destinés à automatiser les tâches de sécurité système.  
Ils permettent de protéger le système, vérifier les mots de passe, auditer les clés SSH, vérifier l’intégrité des fichiers et contrôler les patchs de sécurité.

---

## 📌 Contenu du dossier

| Script | Fonction |
|--------|----------|
| `backup_encryption.sh` | Chiffre un dossier de backup pour sécuriser les données |
| `check_bad_passwd.sh` | Détecte les comptes utilisateurs avec mots de passe faibles ou vides |
| `file_integrity_check.sh` | Vérifie l’intégrité des fichiers critiques du système |
| `os_patch_check.sh` | Vérifie la présence de patchs de sécurité OS disponibles |
| `ssh_key_audit.sh` | Audite les clés SSH des utilisateurs et du root |
| `sudo_audit.sh` | Audite les privilèges sudo des utilisateurs |

---

## 🔧 Installation

Rendre tous les scripts exécutables :

```bash
chmod +x *.sh
```