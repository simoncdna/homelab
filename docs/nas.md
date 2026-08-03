# Le NAS — la machine

*3 août 2026*

Un NAS assemblé plutôt qu'acheté tout fait. Ce document décrit de quoi il est fait et ce que
chaque pièce apporte — les services qui tournent dessus sont décrits ailleurs, dans `nas.json`.

## La configuration

| pièce | modèle | prix |
|---|---|---|
| boîtier | Jonsbo N6 | 180 € |
| carte mère | ASUS Prime B550M-A WIFI II | 96 € |
| processeur | AMD Ryzen 7 5700G — 8 cœurs / 16 fils, iGPU Vega | 210 € |
| mémoire | Crucial Pro 2 × 16 Go DDR4-3200 | 257 € |
| stockage système | WD_BLACK SN7100 500 Go (NVMe) | 135 € |
| alimentation | Corsair RM650e, reconditionnée | 50 € |
| câbles SATA | BENFEI × 6, droits, 45 cm | 15 € |
| ventilateurs | 2 × Noctua NF-A12x25 PWM chromax | 65 € |

**Total : 1 008 €**, dont 65 € de ventilateurs qui ne sont pas strictement nécessaires — 943 €
sans eux.

## Ce que la configuration permet

**Le processeur porte un iGPU.** Le 5700G est un APU : sa partie graphique Vega est intégrée, donc
aucune carte graphique n'est nécessaire. Sur un NAS, c'est ce qui rend le transcodage vidéo
possible sans occuper un port PCIe ni ajouter de consommation au repos.

**Huit cœurs pour un NAS, c'est confortable.** Le stockage lui-même en demande peu ; ce sont les
services qui tournent à côté qui les consomment.

**32 Go de mémoire.** ZFS utilise la mémoire libre comme cache de lecture, et il en prend
volontiers autant qu'on lui en laisse.

## Les disques restent à choisir

Aucun disque de données n'est dans cette liste. Le SN7100 de 500 Go est un disque système : il
accueille TrueNAS et ses applications, pas les données.

La taille n'est pas arrêtée, et l'arbitrage est celui de la parité : **elle coûtera la moitié de
la capacité brute**. C'est ce qui rend le calcul moins évident qu'il n'y paraît — doubler la
taille des disques ne double pas ce qu'on peut y mettre, et le prix au téraoctet utile n'est pas
celui affiché.

Les six câbles SATA droits déjà achetés fixent en revanche l'ordre de grandeur : six disques.
