# DECOD
	Le travail de décod est de décoder les instructions de 32 bits passé par IFETCH, puis traiter ces données décodées par la machine à état.

### 1.	Reg


### 2.	Déodage d’instruction
-	Prédicat
-	Type d’opération
    - opération classique
    - multiplication
    - swap
    - opération de transfert simple
    - opération de transfert multiple
    - branchement
-	Opérande pour exe
    - Op1
    - Op2
    - Opérande Rn Rm Rs

-	Addresse destination pour `EXE` et `MEM`
-	Information pour exe
    - Addresse de destination de l’alu
    - Si EXE doit faire une écriture
    - Si EXE doit mettre à jour les flags
    - Post ou préindexation
    - Type de shift
    - La valeur de shift

-	Information pour MEM
    - Adresse de destination pour MEM
    - Quelle opération de MEM
- Analyse de donné de l'instruction
    - Si les opérandes doivent-ils inversées
    - La commande d'alu
    - Invalidation des addresses mémoire
    - Invalidation des addresses sortie de EXE
    - Invalidation des flags

### 3.	Gestion d’information décodé / prépare les informations pour la machine à état
- Validité des opérandes
- Validité des prédicat
- Si prédicat est vrai
- Si une seul transfert dans une transfert multiple
- Le premier registre à traiter pour la transfert multiple
- mask de list de transfert multiple

### 4. Machine à état
Cette machine à état est là pour contrôler les flôts d’instructions.

######  1. FETCH
Etat d'initialisation ou après un branchement.
Decode doit envoyer une première valeur de pc à `IFETCH` dès que la fifo `dec to if` est vide.

######  2. RUN
Etat qui englobe l'exécution générale des instructions.
Attente que les flags czn et/ou v soit valide et que le prédicat soit valide pour envoyer les instructions.

######  3. BRANCH
Etat en attente que exec calcule et met à jout la valeur de pc.
######  4. LINK

######  5. MTRANS
Etat qui avance le curseur de mask pour avoir l'adresse du prochain transfert.
Si il y a une écriture sur pc, alors c'est un branchement, on passe à `BRANCH`.
Sinon on revient à `RUN`
 
### 5. cycle de gel
On doit exécuter les instructions dans l'ordre.
