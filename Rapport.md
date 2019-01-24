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
    - Opérande Rn Rm Rs

    - Op1

    la valeur de pc si c'est un branchement.
    Rn sinon.
    - Op2

    La valeur de offet si c'est un branhcement ou un transfert d'un imedia.
    Rm sinon.

-	Addresse destination pour `EXE` et `MEM`
-	Information pour exe
    - Addresse de destination de l’alu

    Rd des instructions. Ou l'adresse de PC quand c'est un branchement.
    - Si EXE doit faire une écriture

    Sauf les opérations de teste.
    - Si EXE doit mettre à jour les flags

    Quand le flag S de calcule est mis ou que c'est une opération de teste.
    - Post ou préindexation

    Quand le flag P = 1
    - Type de shift

    Décodé sur les bits 5-6
    - La valeur de shift

    Les 5 bit de poids faible de Rs si le shift est un registre.

-	Information pour MEM
    - Adresse de destination pour MEM

    - Quelle opération de MEM
- Analyse de donné de l'instruction
    - Si les opérandes doivent-ils inversées

    On regarde quel est l'instruction puis on met le bit d'inversion pour `EXE`.

    Il faut aussi faire +1 sur la valeur de carry.

    Certains opération ne prend alors que la valeur de carry du `REG`.

    - La commande d'alu

    La commande d'alu est déterminée selon l'opération décodé.
    - Invalidation des addresses mémoire

    Si l'instruction est un load, on doit invalider l'addresse de destinations.
    - Invalidation des addresses sortie de EXE

    - Invalidation des flags

    Si l'opération est une opération logique,


### 3.	Gestion d’information décodé / prépare les informations pour la machine à état
- Validité des opérandes

les opérandes sont valides si l'addresse de Rm Rn et Rs sont valides.
- Validité des prédicat

Si la validité des flags czn et/ou v sont valides.
- Si prédicat est vrai

- Si une seul transfert dans une transfert multiple
- Le premier registre à traiter pour la transfert multiple
- mask de list de transfert multiple

### 4. Machine à état
Cette machine à état est là pour contrôler les flôts d’instructions.

######  1. FETCH
Etat d'initialisation ou après un branchement.

Decode doit envoyer une première valeur de pc à `IFETCH` dès que la fifo `dec to if` est vide.

Une fois cette valeur envoyé, on passe à `RUN`.
######  2. RUN
Etat qui englobe l'exécution générale des instructions.

Attente que les flags czn et/ou v soit valide et que le prédicat soit valide pour savoir si on traite ou pas les instructions.

Si le prédicat est vrai et valide alors on peut exécuter l'instruction.

Si c'est un branchement on passe à `BRANCH`.

Si c'est une transfert multiple on passe à `MTRANS`.
######  3. BRANCH
Etat en attente que exec calcule et met à jout la valeur de pc.

Purge PC des buffers `if to dec` et `dec to if`.

Si pc est valide on revient dans `RUN` sinon on passe à `IFETCH`.
######  4. LINK
Sauvegarde la valeur de PC sur SP.

Demande à `EXE` de calculer une nouvelle valeur de PC.

######  5. MTRANS
Etat qui avance le curseur de mask pour avoir l'adresse du prochain transfert.

Si il y a une écriture sur pc, alors c'est un branchement, on passe à `BRANCH`.

Sinon on revient à `RUN`
 
### 5. cycle de gel
On doit exécuter les instructions dans l'ordre.

# EXE
### alu
### shifter