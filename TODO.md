# TODO :boom:
> Petite liste d'idées, de trucs à faire et de pistes possibles pour améliorer cette application...
> Toute suggestion [est la bienvenue](https://github.com/Naereen/kaamelott-soundboard-desktop-app/issues/new) (via un nouveau ticket).

## GNU/Linux et autres
- [ ] Tester l'application sur un autre Ubuntu (une machine différente)
- [ ] Tester l'application sur un GNU/Linux non Ubuntu (Debian, Mint etc)
- [ ] Tester l'application sur un système non basé sur GNU/Linux (ex. BSD, Fedora etc)
- [ ] Comprendre (et corriger) le bug suivant : quand l'application est lancée depuis la ligne de commande, l'icône d'écoute, la pause et le partage fonctionnent bien, mais pas quand lancée via le .desktop ou le menu...

## Mac OS X
- [ ] Tester l'application sur Mac OS X
- [ ] Vérifier qu'elle s'installe bien comme [je le dit ici](https://github.com/Naereen/kaamelott-soundboard-desktop-app/releases/latest) (en déplaçant le .app sur le bureau -- je n'ai pas utilisé de Mac depuis des années, désolé si je me loupe)

## Windows
- [ ] Tester l'application sur Windows 7, 8, 10
- [ ] ? Faire un installeur Windows ou une application bien empaquetée dans un .exe entier (idée : archive zip auto-exécutable)

----

## Améliorations
### Améliorations pas trop dures (mais pas très utile)
- [ ] Alléger le dépôt git pour juste contenir les *changements* à faire et les scripts de configuration et constructions
- [ ] Rester à jour avec l'application (probablement en faisant le point précédent, ou à la main)
- [ ] Automatiser encore plus la génération des différentes applications, l'élagage et la compression des dossiers (app/node_modules, screenshots etc servent à rien), et la création des archives .zip (ou .exe / .dmg / ??) à téléverser sur GitHub

### Meilleure présentation !
- [ ] Faire une jolie page simple avec des liens de téléchargements (avec des icônes "font-awesome large") pour chaque plateformes, et des captures d'écran de démonstration. L'héberger sur https://naereen.github.io/kaamelott-soundboard-desktop-app/ ? Oui ça suffit (la page web de téléchargement `index.html` peut être dans la branche 'gh-pages', ça évitera la bidouille dégueue d'avoir le `README.md` copié dans `ðocs/` ainsi que les [captures d'écrans](screenshots/)...
- [ ] Faire un site à part ? Ou demander à @2ec0b4 de mettre un lien depuis sa version vers le téléchargement de l'application bureau ?

### Meilleure sécurité ?
- [ ] Signer avec [GnuPG](http://perso.crans.org/besson/pgp.html) les fichiers .zip présents sur la page GitHub ?! (en plus de signer les modifications et les étiquettes ? ... pourquoi ?)
- [ ] Proposer moi-même une petite liste (manuellement écrite) des empreintes MD5/SHA1/SHA2 des fichiers .zip (ou autres ...) donnés en téléchargement ?

----

## Autres idées
### Application mobile automatique ?
- Utiliser [Apache Cordova](https://cordova.apache.org/#getstarted) et en particulier [PhoneGap](https://build.phonegap.com/people/sign_in) pour faire, de la même façon, une application pour mobile (Android, Windows, iOS), "facilement"
