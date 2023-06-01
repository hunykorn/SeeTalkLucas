CREATE TABLE IF NOT EXISTS UTILISATEUR
 (
   ID_USER INTEGER(2) NOT NULL AUTO_INCREMENT ,
   PSEUDO VARCHAR(255) NULL  ,
   NOM VARCHAR(255) NULL  ,
   PRENOM VARCHAR(255) NULL  ,
   PASSWORD VARCHAR(255) NULL  ,
   SOCIETE VARCHAR(255) NULL  ,
   BIO TEXT NULL  ,
   EMAIL VARCHAR(255) NULL  ,
   TELEPHONE VARCHAR(255) NULL  ,
   IMG VARCHAR(255) NULL  
   , PRIMARY KEY (ID_USER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : APPEL_VIDEO
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPEL_VIDEO
 (
   ID_APPEL INTEGER(2) NOT NULL AUTO_INCREMENT ,
   DATE_APPEL timestamp NULL  ,
   DUREE INTEGER(2) NULL  
   , PRIMARY KEY (ID_APPEL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ACTUALITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ACTUALITE
 (
   ID_ACTU INTEGER(2) NOT NULL AUTO_INCREMENT ,
   TITRE VARCHAR(255) NULL  ,
   MESSAGE TEXT NULL  
   , PRIMARY KEY (ID_ACTU) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MESSAGE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MESSAGE
 (
   ID_MESSAGE INTEGER(2) NOT NULL AUTO_INCREMENT ,
   CONTENU TEXT NULL  ,
   DATE_MESSAGE timestamp NULL  
   , PRIMARY KEY (ID_MESSAGE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : REUNION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REUNION
 (
   ID_REUNION INTEGER(2) NOT NULL AUTO_INCREMENT ,
   NOM VARCHAR(255) NULL  ,
   DESCRIPTION TEXT NULL  ,
   DATE_REUNION timestamp NULL  
   , PRIMARY KEY (ID_REUNION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : APPELER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPELER
 (
   ID_APPEL INTEGER(2) NOT NULL  ,
   ID_USER INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_APPEL,ID_USER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE APPELER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_APPELER_APPEL_VIDEO
     ON APPELER (ID_APPEL ASC);

CREATE  INDEX I_FK_APPELER_UTILISATEUR
     ON APPELER (ID_USER ASC);

# -----------------------------------------------------------------------------
#       TABLE : RECEVOIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RECEVOIR
 (
   ID_MESSAGE INTEGER(2) NOT NULL  ,
   ID_USER INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_MESSAGE,ID_USER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE RECEVOIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_RECEVOIR_MESSAGE
     ON RECEVOIR (ID_MESSAGE ASC);

CREATE  INDEX I_FK_RECEVOIR_UTILISATEUR
     ON RECEVOIR (ID_USER ASC);

# -----------------------------------------------------------------------------
#       TABLE : CREER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CREER
 (
   ID_USER INTEGER(2) NOT NULL  ,
   ID_REUNION INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_USER,ID_REUNION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CREER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CREER_UTILISATEUR
     ON CREER (ID_USER ASC);

CREATE  INDEX I_FK_CREER_REUNION
     ON CREER (ID_REUNION ASC);

# -----------------------------------------------------------------------------
#       TABLE : ETRE_APPELE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETRE_APPELE
 (
   ID_USER INTEGER(2) NOT NULL  ,
   ID_APPEL INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_USER,ID_APPEL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ETRE_APPELE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ETRE_APPELE_UTILISATEUR
     ON ETRE_APPELE (ID_USER ASC);

CREATE  INDEX I_FK_ETRE_APPELE_APPEL_VIDEO
     ON ETRE_APPELE (ID_APPEL ASC);

# -----------------------------------------------------------------------------
#       TABLE : ENVOYER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENVOYER
 (
   ID_USER INTEGER(2) NOT NULL  ,
   ID_MESSAGE INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_USER,ID_MESSAGE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ENVOYER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ENVOYER_UTILISATEUR
     ON ENVOYER (ID_USER ASC);

CREATE  INDEX I_FK_ENVOYER_MESSAGE
     ON ENVOYER (ID_MESSAGE ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE APPELER 
  ADD FOREIGN KEY FK_APPELER_APPEL_VIDEO (ID_APPEL)
      REFERENCES APPEL_VIDEO (ID_APPEL) ;


ALTER TABLE APPELER 
  ADD FOREIGN KEY FK_APPELER_UTILISATEUR (ID_USER)
      REFERENCES UTILISATEUR (ID_USER) ;


ALTER TABLE RECEVOIR 
  ADD FOREIGN KEY FK_RECEVOIR_MESSAGE (ID_MESSAGE)
      REFERENCES MESSAGE (ID_MESSAGE) ;


ALTER TABLE RECEVOIR 
  ADD FOREIGN KEY FK_RECEVOIR_UTILISATEUR (ID_USER)
      REFERENCES UTILISATEUR (ID_USER) ;


ALTER TABLE CREER 
  ADD FOREIGN KEY FK_CREER_UTILISATEUR (ID_USER)
      REFERENCES UTILISATEUR (ID_USER) ;


ALTER TABLE CREER 
  ADD FOREIGN KEY FK_CREER_REUNION (ID_REUNION)
      REFERENCES REUNION (ID_REUNION) ;


ALTER TABLE ETRE_APPELE 
  ADD FOREIGN KEY FK_ETRE_APPELE_UTILISATEUR (ID_USER)
      REFERENCES UTILISATEUR (ID_USER) ;


ALTER TABLE ETRE_APPELE 
  ADD FOREIGN KEY FK_ETRE_APPELE_APPEL_VIDEO (ID_APPEL)
      REFERENCES APPEL_VIDEO (ID_APPEL) ;


ALTER TABLE ENVOYER 
  ADD FOREIGN KEY FK_ENVOYER_UTILISATEUR (ID_USER)
      REFERENCES UTILISATEUR (ID_USER) ;


ALTER TABLE ENVOYER 
  ADD FOREIGN KEY FK_ENVOYER_MESSAGE (ID_MESSAGE)
      REFERENCES MESSAGE (ID_MESSAGE) ;

