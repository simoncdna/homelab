#!/usr/bin/env bash
#
# Exporte la topologie Proxmox dans proxmox.json, à relancer quand le serveur change.
#
# Rien n'est stocké comme secret : pvesh tourne sur l'hôte avec ses droits locaux et on ne
# rapatrie que du JSON. La sortie brute de pvesh porte 24 champs, dont pid, uptime et six
# métriques de pression — on n'en garde que la topologie, sans quoi chaque export produirait
# un diff de bruit et git cesserait de signaler les vrais changements.
#
#   ./bin/export-proxmox.sh
#   PROXMOX_HOST=root@192.168.1.42 PROXMOX_NODE=autre ./bin/export-proxmox.sh
#
set -euo pipefail

HOST="${PROXMOX_HOST:-root@haven}"
NODE="${PROXMOX_NODE:-haven}"
OUT="$(cd "$(dirname "$0")/.." && pwd)/proxmox.json"

command -v jq >/dev/null || { echo "jq est requis" >&2; exit 1; }

ssh "$HOST" "pvesh get /nodes/$NODE/lxc --output-format json" \
  | jq --arg node "$NODE" '{
      host: $node,
      lxc: [ .[] | { vmid, name, tags: (.tags // "") } ] | sort_by(.vmid)
    }' \
  > "$OUT"

echo "→ $OUT"
jq -r '.lxc[] | "  \(.vmid)  \(.name)"' "$OUT"
