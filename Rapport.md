DECOD
	Le travail de décod est de décoder les instructions de 32 bits passé par IFETCH, puis traiter ces données décodées par la machine à état.

1.	Reg


2.	Déodage d’instruction
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

-	Addresse destination pour EXE et MEM
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

3.	Gestion d’information décodé / prépare les informations pour la machine à état
-	Invalidation des addresses mémoire
-	Invalidation des addresses sortie de EXE
-	Invalidation des flags
    - Flag czn
    - Flag v
-	Validité des opérandes
-	
4.	Machine à état
Cette machine à état est là pour contrôler les flôts d’instructions,
?
 
