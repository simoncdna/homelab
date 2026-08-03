# Haven — la machine

*3 août 2026*

L'hôte Proxmox de la maison : un mini-PC du commerce, acheté monté. Il fait tourner les trois
conteneurs LXC décrits dans `proxmox.json` — `infra`, `apps`, `gaming`.

## La configuration

| pièce | modèle |
|---|---|
| machine | Beelink, mini-PC |
| processeur | Intel N95 — 4 cœurs, 4 fils |
| mémoire | 16 Go |
| stockage | 500 Go |

## Ce que ça vaut

**Quatre cœurs et quatre fils.** Le N95 est un Alder Lake-N : uniquement des cœurs d'efficacité,
pas d'hyperthreading. Un cœur occupé est donc un cœur en moins, sans le rattrapage partiel qu'offre
le SMT — ce qui compte quand trois LXC se partagent la machine.

**Une enveloppe thermique d'une quinzaine de watts.** C'est le vrai argument d'un tel boîtier pour
un serveur qui tourne en permanence : il consomme peu, ne fait pas de bruit, et se pose n'importe
où. Sur une machine allumée 24 h sur 24, la consommation compte davantage que la puissance de
pointe.

**500 Go pour l'hôte et ses trois conteneurs.** C'est confortable pour des services, court dès
qu'on y stocke des données — ce qui est précisément le rôle dévolu au NAS.

## Le rapport avec le NAS

Il vaut la peine d'être noté : **le NAS est nettement plus puissant que le serveur**. Huit cœurs
et seize fils contre quatre et quatre, 32 Go de mémoire contre 16.

Ce n'est pas un déséquilibre à corriger, c'est une conséquence de leurs rôles. `haven` orchestre
des services légers en continu et doit surtout consommer peu ; le NAS sert du stockage sous ZFS,
qui réclame de la mémoire, et transcode à l'occasion, ce qui réclame des cœurs.

Cela dit, le jour où un service devient trop lourd pour `haven`, la machine qui a de la marge
n'est pas celle qu'on croit.
