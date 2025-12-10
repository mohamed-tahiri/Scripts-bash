# 🛠️ Scripts Utils Base – Dossier `05_utils_base`

Ce dossier contient un ensemble de scripts Shell utilitaires réutilisables pour l'administration système et le développement Bash.  
Ils permettent la validation d'entrées, le logging, le parsing de configuration, la gestion des processus et la création de menus interactifs.

---

## 📌 Contenu du dossier

| Script | Fonction |
|--------|----------|
| `config_parser.sh` | Parse les fichiers de configuration au format clé=valeur |
| `dependency_check.sh` | Vérifie la présence des dépendances essentielles sur le système |
| `input_validation.sh` | Fournit des fonctions pour valider les entrées utilisateurs |
| `interactive_prompt.sh` | Crée un menu interactif simple |
| `logging.sh` | Fournit des fonctions de logging centralisé (info, warn, error) |
| `process_utils.sh` | Fonctions de gestion des processus (list, kill) |

---

## 🔧 Installation

Rendre tous les scripts exécutables :

```bash
chmod +x *.sh
```