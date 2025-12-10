# 🌐 Scripts Network – Dossier `02_network`

Ce dossier contient un ensemble de scripts Shell dédiés à l'administration et au diagnostic réseau.  
Ils permettent de tester la connectivité, analyser DNS, vérifier SSL, inspecter les interfaces réseau, gérer le routage et configurer du port forwarding.

---

## 📌 Contenu du dossier

| Script | Fonction |
|--------|----------|
| `bandwidth_test.sh` | Teste la latence et la bande passante via ping et téléchargement |
| `check_ssl_cert.sh` | Vérifie les dates d’expiration d’un certificat SSL |
| `dns_propagation_check.sh` | Analyse la propagation DNS sur plusieurs serveurs (Google, Cloudflare…) |
| `find_ip_mac.sh` | Affiche l’adresse IP et la MAC d’une interface réseau |
| `port_forward_setup.sh` | Configure un port forwarding (NAT) via iptables |
| `show_route.sh` | Affiche la table de routage IPv4 et IPv6 |
| `network_toolbox.sh` | Menu interactif regroupant tous les outils réseau du dossier |

---

## 🔧 Installation

Rendre tous les scripts exécutables :

```bash
chmod +x *.sh
```