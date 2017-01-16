program TP_carre_magique (output);

uses crt;

const
        DebutI=1; //Min de I
        DebutJ=1; //Min de J
        FinI=5; //Max de I
        FinJ=5; //Max de J

type
        Tableau=Array[DebutI..FinI,DebutJ..FinJ] of integer;

procedure InitTabCarre (var TabCarre:Tableau; i,j:integer);

        begin
        //Initialise les valeurs de toutes les cases du tableau a 0
        FOR i:=DebutI TO FinI DO
                begin
                FOR j:=DebutJ TO FinJ DO
                        begin
                        TabCarre[i,j]:=0;
                        end;
                end;
        end;

procedure InitPosDeb (var i,j:integer);

        begin
        //On se positionne une case au dessus du milieu du tableau pour commencer les deplacements
        i:=(FinI DIV 2)+1;
        j:=(FinJ DIV 2);
        end;

procedure AvancerDroite (var TabCarre:Tableau; var i,j:integer);

        begin
        //Avance en diagonale droite
        i:=i-1;
        j:=j+1;

        IF i<DebutI THEN //Si la valeur de i va en dessous de la limite elle reprend de la fin de la ligne
                i:=FinI;

        IF j>FinJ THEN //Si la valeur de J va au dessus de la limite elle reprend au debut de la ligne
                j:=DebutJ;
        end;

procedure AvancerGauche (var TabCarre:Tableau; var i,j:integer);

        begin
        WHILE TabCarre[i,j]<>0 DO //Tant que la case sur laquelle on se positionne est deja remplie, on avance en diagonale gauche
                begin
                i:=i-1;
                j:=j-1;

                IF i<DebutI THEN //Si la valeur de i va en dessous de la limite elle reprend de la fin de la ligne
                        i:=FinI;

                IF j<DebutJ THEN
                        j:=FinJ; //Si la valeur de j va en dessous de la limite elle reprend de la fin de la ligne
                end;
        end;

procedure AffTabCarre (var TabCarre:Tableau; i,j:integer);

        begin
        //Affiche case par case la valeur de chacune avec des espaces avant et apres le nombre
        FOR i:=DebutI TO FinI DO
                begin
                FOR j:=DebutJ TO FinJ DO
                        begin
                        write(' ',TabCarre[i,j],' ');
                        end;
                writeln;
                end;
        end;

var
        TabCarre:Tableau; //Tableau du carre magique

        position, i, j, compteur, NbCases:integer;

BEGIN
        clrscr;
        writeln('Programme : carre magique');

        //Initialisation du tableau
        InitTabCarre(TabCarre,i,j);

        //Initialisation de la position de debut
        InitPosDeb(i,j);

        //Deplacements et pose dans le tableau
        NbCases:=FinI*FinJ; //le nombre de cases est egal a la longueur multiplie par la largeur du tableau
        //Le programme va continuer de se deplacer pour remplir les cases de 1 jusqu'au maximum
        FOR compteur:=1 TO NbCases DO
                begin
                //Avance en diagonale droite
                AvancerDroite(TabCarre,i,j);

                //Avance en diagonale gauche
                AvancerGauche(TabCarre,i,j);

                TabCarre[i,j]:=compteur;//Donne la valeur du compteur a la case sur laquelle on se positionne
                end;

        //Afficher le tableau
        AffTabCarre(TabCarre,i,j);

        readln;
END.
