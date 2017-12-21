
CREATE TABLE Charge
(
	Charge_ID             VARCHAR2(8)  NOT NULL ,
	Enter_Fee             NUMBER(10)  NOT NULL ,
	Enter_ID              VARCHAR2(8)  NOT NULL ,
	Sight_ID              VARCHAR2(8)  NOT NULL 
);



CREATE UNIQUE INDEX XPKEnter_Fee ON Charge
(Charge_ID  ASC);



ALTER TABLE Charge
	ADD CONSTRAINT  XPKEnter_Fee PRIMARY KEY (Charge_ID);



CREATE TABLE Enter
(
	Enter_ID              VARCHAR2(8)  NOT NULL ,
	Enter_Type            VARCHAR2(30)  NOT NULL ,
	Sight_ID              VARCHAR2(8)  NOT NULL 
);



CREATE UNIQUE INDEX XPKEnter ON Enter
(Enter_ID  ASC);



ALTER TABLE Enter
	ADD CONSTRAINT  XPKEnter PRIMARY KEY (Enter_ID);



CREATE TABLE Food
(
	Food_ID               VARCHAR2(8)  NOT NULL ,
	Food_Name             VARCHAR2(40)  NOT NULL ,
	Sight_ID              VARCHAR2(8)  NOT NULL ,
	Food_Image            BLOB  NULL 
);



CREATE UNIQUE INDEX XPKFood ON Food
(Food_ID  ASC);



ALTER TABLE Food
	ADD CONSTRAINT  XPKFood PRIMARY KEY (Food_ID);



CREATE TABLE Restaurant
(
	Restaurant_ID         VARCHAR2(8)  NOT NULL ,
	Restaurant_Name       VARCHAR2(40)  NOT NULL ,
	Food_Fee              NUMBER(10)  NOT NULL ,
	Food_ID               VARCHAR2(8)  NOT NULL ,
	Sight_ID              VARCHAR2(8)  NOT NULL ,
	Restaurant_Image      BLOB  NULL 
);



CREATE UNIQUE INDEX XPKRestaraunt ON Restaurant
(Restaurant_ID  ASC);



ALTER TABLE Restaurant
	ADD CONSTRAINT  XPKRestaraunt PRIMARY KEY (Restaurant_ID);



CREATE TABLE Room
(
	Room_ID               VARCHAR2(8)  NOT NULL ,
	Room_Name             VARCHAR2(40)  NOT NULL ,
	Room_Fee              NUMBER(10)  NOT NULL ,
	Stay_ID               VARCHAR2(8)  NOT NULL ,
	Sight_ID              VARCHAR2(8)  NOT NULL ,
	Room_Type             VARCHAR2(60)  NOT NULL ,
	Room_Image            BLOB  NULL 
);



CREATE UNIQUE INDEX XPKAccom ON Room
(Room_ID  ASC);



ALTER TABLE Room
	ADD CONSTRAINT  XPKAccom PRIMARY KEY (Room_ID);



CREATE TABLE Sight
(
	Sight_ID              VARCHAR2(8)  NOT NULL ,
	Sight_Name            VARCHAR2(40)  NOT NULL ,
	Station_ID            VARCHAR2(8)  NOT NULL ,
	Sight_Image           BLOB  NULL 
);



CREATE UNIQUE INDEX XPKSight ON Sight
(Sight_ID  ASC);



ALTER TABLE Sight
	ADD CONSTRAINT  XPKSight PRIMARY KEY (Sight_ID);



CREATE TABLE Station
(
	Station_ID            VARCHAR2(8)  NOT NULL ,
	Station_Name          VARCHAR2(30)  NOT NULL ,
	Station_Image         BLOB  NULL 
);



CREATE UNIQUE INDEX XPKStation ON Station
(Station_ID  ASC);



ALTER TABLE Station
	ADD CONSTRAINT  XPKStation PRIMARY KEY (Station_ID);



CREATE TABLE Stay
(
	Stay_ID               VARCHAR2(8)  NOT NULL ,
	Stay_Name             VARCHAR2(40)  NOT NULL ,
	Sight_ID              VARCHAR2(8)  NOT NULL ,
	Stay_Image            BLOB  NULL 
);



CREATE UNIQUE INDEX XPKStay ON Stay
(Stay_ID  ASC);



ALTER TABLE Stay
	ADD CONSTRAINT  XPKStay PRIMARY KEY (Stay_ID);



ALTER TABLE Charge
	ADD (CONSTRAINT  R_8 FOREIGN KEY (Enter_ID) REFERENCES Enter(Enter_ID));



ALTER TABLE Charge
	ADD (CONSTRAINT  R_9 FOREIGN KEY (Sight_ID) REFERENCES Sight(Sight_ID));



ALTER TABLE Enter
	ADD (CONSTRAINT  R_7 FOREIGN KEY (Sight_ID) REFERENCES Sight(Sight_ID));



ALTER TABLE Food
	ADD (CONSTRAINT  R_6 FOREIGN KEY (Sight_ID) REFERENCES Sight(Sight_ID));



ALTER TABLE Restaurant
	ADD (CONSTRAINT  R_10 FOREIGN KEY (Food_ID) REFERENCES Food(Food_ID));



ALTER TABLE Restaurant
	ADD (CONSTRAINT  R_11 FOREIGN KEY (Sight_ID) REFERENCES Sight(Sight_ID));



ALTER TABLE Room
	ADD (CONSTRAINT  R_3 FOREIGN KEY (Stay_ID) REFERENCES Stay(Stay_ID));



ALTER TABLE Room
	ADD (CONSTRAINT  R_4 FOREIGN KEY (Sight_ID) REFERENCES Sight(Sight_ID));



ALTER TABLE Sight
	ADD (CONSTRAINT  R_1 FOREIGN KEY (Station_ID) REFERENCES Station(Station_ID));



ALTER TABLE Stay
	ADD (CONSTRAINT  R_2 FOREIGN KEY (Sight_ID) REFERENCES Sight(Sight_ID));



CREATE  TRIGGER tI_Charge BEFORE INSERT ON Charge for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- INSERT trigger on Charge 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Enter  Charge on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f0e7", PARENT_OWNER="", PARENT_TABLE="Enter"
    CHILD_OWNER="", CHILD_TABLE="Charge"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="Enter_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Enter
      WHERE
        /* %JoinFKPK(:%New,Enter," = "," AND") */
        :new.Enter_ID = Enter.Enter_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Charge because Enter does not exist.'
      );
    END IF;

    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Charge on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Charge"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Sight
      WHERE
        /* %JoinFKPK(:%New,Sight," = "," AND") */
        :new.Sight_ID = Sight.Sight_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Charge because Sight does not exist.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tU_Charge AFTER UPDATE ON Charge for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- UPDATE trigger on Charge 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Enter  Charge on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020778", PARENT_OWNER="", PARENT_TABLE="Enter"
    CHILD_OWNER="", CHILD_TABLE="Charge"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="Enter_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Enter
    WHERE
      /* %JoinFKPK(:%New,Enter," = "," AND") */
      :new.Enter_ID = Enter.Enter_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Charge because Enter does not exist.'
    );
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Charge on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Charge"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="Sight_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Sight
    WHERE
      /* %JoinFKPK(:%New,Sight," = "," AND") */
      :new.Sight_ID = Sight.Sight_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Charge because Sight does not exist.'
    );
  END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/


CREATE  TRIGGER tI_Enter BEFORE INSERT ON Enter for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- INSERT trigger on Enter 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Enter on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f19a", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Enter"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Sight
      WHERE
        /* %JoinFKPK(:%New,Sight," = "," AND") */
        :new.Sight_ID = Sight.Sight_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Enter because Sight does not exist.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tD_Enter AFTER DELETE ON Enter for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- DELETE trigger on Enter 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Enter  Charge on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e29c", PARENT_OWNER="", PARENT_TABLE="Enter"
    CHILD_OWNER="", CHILD_TABLE="Charge"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="Enter_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Charge
      WHERE
        /*  %JoinFKPK(Charge,:%Old," = "," AND") */
        Charge.Enter_ID = :old.Enter_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Enter because Charge exists.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tU_Enter AFTER UPDATE ON Enter for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- UPDATE trigger on Enter 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Enter  Charge on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000202c9", PARENT_OWNER="", PARENT_TABLE="Enter"
    CHILD_OWNER="", CHILD_TABLE="Charge"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="Enter_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Enter_ID <> :new.Enter_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Charge
      WHERE
        /*  %JoinFKPK(Charge,:%Old," = "," AND") */
        Charge.Enter_ID = :old.Enter_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Enter because Charge exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Enter on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Enter"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="Sight_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Sight
    WHERE
      /* %JoinFKPK(:%New,Sight," = "," AND") */
      :new.Sight_ID = Sight.Sight_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Enter because Sight does not exist.'
    );
  END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/


CREATE  TRIGGER tI_Food BEFORE INSERT ON Food for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- INSERT trigger on Food 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Food on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000ee8a", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Food"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Sight
      WHERE
        /* %JoinFKPK(:%New,Sight," = "," AND") */
        :new.Sight_ID = Sight.Sight_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Food because Sight does not exist.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tD_Food AFTER DELETE ON Food for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- DELETE trigger on Food 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Food  Restaurant on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000d7de", PARENT_OWNER="", PARENT_TABLE="Food"
    CHILD_OWNER="", CHILD_TABLE="Restaurant"
    P2C_VERB_PHRASE="R/10", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="Food_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Restaurant
      WHERE
        /*  %JoinFKPK(Restaurant,:%Old," = "," AND") */
        Restaurant.Food_ID = :old.Food_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Food because Restaurant exists.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tU_Food AFTER UPDATE ON Food for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- UPDATE trigger on Food 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Food  Restaurant on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000202b3", PARENT_OWNER="", PARENT_TABLE="Food"
    CHILD_OWNER="", CHILD_TABLE="Restaurant"
    P2C_VERB_PHRASE="R/10", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="Food_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Food_ID <> :new.Food_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Restaurant
      WHERE
        /*  %JoinFKPK(Restaurant,:%Old," = "," AND") */
        Restaurant.Food_ID = :old.Food_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Food because Restaurant exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Food on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Food"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="Sight_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Sight
    WHERE
      /* %JoinFKPK(:%New,Sight," = "," AND") */
      :new.Sight_ID = Sight.Sight_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Food because Sight does not exist.'
    );
  END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/


CREATE  TRIGGER tI_Restaurant BEFORE INSERT ON Restaurant for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- INSERT trigger on Restaurant 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Food  Restaurant on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001ebd6", PARENT_OWNER="", PARENT_TABLE="Food"
    CHILD_OWNER="", CHILD_TABLE="Restaurant"
    P2C_VERB_PHRASE="R/10", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="Food_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Food
      WHERE
        /* %JoinFKPK(:%New,Food," = "," AND") */
        :new.Food_ID = Food.Food_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Restaurant because Food does not exist.'
      );
    END IF;

    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Restaurant on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Restaurant"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Sight
      WHERE
        /* %JoinFKPK(:%New,Sight," = "," AND") */
        :new.Sight_ID = Sight.Sight_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Restaurant because Sight does not exist.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tU_Restaurant AFTER UPDATE ON Restaurant for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- UPDATE trigger on Restaurant 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Food  Restaurant on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f498", PARENT_OWNER="", PARENT_TABLE="Food"
    CHILD_OWNER="", CHILD_TABLE="Restaurant"
    P2C_VERB_PHRASE="R/10", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="Food_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Food
    WHERE
      /* %JoinFKPK(:%New,Food," = "," AND") */
      :new.Food_ID = Food.Food_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Restaurant because Food does not exist.'
    );
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Restaurant on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Restaurant"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="Sight_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Sight
    WHERE
      /* %JoinFKPK(:%New,Sight," = "," AND") */
      :new.Sight_ID = Sight.Sight_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Restaurant because Sight does not exist.'
    );
  END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/


CREATE  TRIGGER tI_Room BEFORE INSERT ON Room for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- INSERT trigger on Room 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Stay  Room on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001dc09", PARENT_OWNER="", PARENT_TABLE="Stay"
    CHILD_OWNER="", CHILD_TABLE="Room"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="Stay_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Stay
      WHERE
        /* %JoinFKPK(:%New,Stay," = "," AND") */
        :new.Stay_ID = Stay.Stay_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Room because Stay does not exist.'
      );
    END IF;

    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Room on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Room"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Sight
      WHERE
        /* %JoinFKPK(:%New,Sight," = "," AND") */
        :new.Sight_ID = Sight.Sight_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Room because Sight does not exist.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tU_Room AFTER UPDATE ON Room for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- UPDATE trigger on Room 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Stay  Room on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001e253", PARENT_OWNER="", PARENT_TABLE="Stay"
    CHILD_OWNER="", CHILD_TABLE="Room"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="Stay_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Stay
    WHERE
      /* %JoinFKPK(:%New,Stay," = "," AND") */
      :new.Stay_ID = Stay.Stay_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Room because Stay does not exist.'
    );
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Room on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Room"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="Sight_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Sight
    WHERE
      /* %JoinFKPK(:%New,Sight," = "," AND") */
      :new.Sight_ID = Sight.Sight_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Room because Sight does not exist.'
    );
  END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/


CREATE  TRIGGER tI_Sight BEFORE INSERT ON Sight for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- INSERT trigger on Sight 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Station  Sight on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f729", PARENT_OWNER="", PARENT_TABLE="Station"
    CHILD_OWNER="", CHILD_TABLE="Sight"
    P2C_VERB_PHRASE="R/1", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="Station_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Station
      WHERE
        /* %JoinFKPK(:%New,Station," = "," AND") */
        :new.Station_ID = Station.Station_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Sight because Station does not exist.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tD_Sight AFTER DELETE ON Sight for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- DELETE trigger on Sight 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Stay on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="000575cd", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Stay"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Stay
      WHERE
        /*  %JoinFKPK(Stay,:%Old," = "," AND") */
        Stay.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Sight because Stay exists.'
      );
    END IF;

    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Room on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Room"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Room
      WHERE
        /*  %JoinFKPK(Room,:%Old," = "," AND") */
        Room.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Sight because Room exists.'
      );
    END IF;

    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Food on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Food"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Food
      WHERE
        /*  %JoinFKPK(Food,:%Old," = "," AND") */
        Food.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Sight because Food exists.'
      );
    END IF;

    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Enter on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Enter"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Enter
      WHERE
        /*  %JoinFKPK(Enter,:%Old," = "," AND") */
        Enter.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Sight because Enter exists.'
      );
    END IF;

    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Charge on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Charge"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Charge
      WHERE
        /*  %JoinFKPK(Charge,:%Old," = "," AND") */
        Charge.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Sight because Charge exists.'
      );
    END IF;

    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Restaurant on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Restaurant"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Restaurant
      WHERE
        /*  %JoinFKPK(Restaurant,:%Old," = "," AND") */
        Restaurant.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Sight because Restaurant exists.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tU_Sight AFTER UPDATE ON Sight for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- UPDATE trigger on Sight 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Stay on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00076104", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Stay"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="Sight_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Sight_ID <> :new.Sight_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Stay
      WHERE
        /*  %JoinFKPK(Stay,:%Old," = "," AND") */
        Stay.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Sight because Stay exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Room on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Room"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="Sight_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Sight_ID <> :new.Sight_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Room
      WHERE
        /*  %JoinFKPK(Room,:%Old," = "," AND") */
        Room.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Sight because Room exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Food on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Food"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="Sight_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Sight_ID <> :new.Sight_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Food
      WHERE
        /*  %JoinFKPK(Food,:%Old," = "," AND") */
        Food.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Sight because Food exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Enter on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Enter"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="Sight_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Sight_ID <> :new.Sight_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Enter
      WHERE
        /*  %JoinFKPK(Enter,:%Old," = "," AND") */
        Enter.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Sight because Enter exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Charge on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Charge"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="Sight_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Sight_ID <> :new.Sight_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Charge
      WHERE
        /*  %JoinFKPK(Charge,:%Old," = "," AND") */
        Charge.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Sight because Charge exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Restaurant on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Restaurant"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="Sight_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Sight_ID <> :new.Sight_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Restaurant
      WHERE
        /*  %JoinFKPK(Restaurant,:%Old," = "," AND") */
        Restaurant.Sight_ID = :old.Sight_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Sight because Restaurant exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Station  Sight on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Station"
    CHILD_OWNER="", CHILD_TABLE="Sight"
    P2C_VERB_PHRASE="R/1", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="Station_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Station
    WHERE
      /* %JoinFKPK(:%New,Station," = "," AND") */
      :new.Station_ID = Station.Station_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Sight because Station does not exist.'
    );
  END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/


CREATE  TRIGGER tD_Station AFTER DELETE ON Station for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- DELETE trigger on Station 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Station  Sight on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e339", PARENT_OWNER="", PARENT_TABLE="Station"
    CHILD_OWNER="", CHILD_TABLE="Sight"
    P2C_VERB_PHRASE="R/1", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="Station_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Sight
      WHERE
        /*  %JoinFKPK(Sight,:%Old," = "," AND") */
        Sight.Station_ID = :old.Station_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Station because Sight exists.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tU_Station AFTER UPDATE ON Station for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- UPDATE trigger on Station 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Station  Sight on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00010792", PARENT_OWNER="", PARENT_TABLE="Station"
    CHILD_OWNER="", CHILD_TABLE="Sight"
    P2C_VERB_PHRASE="R/1", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="Station_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Station_ID <> :new.Station_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Sight
      WHERE
        /*  %JoinFKPK(Sight,:%Old," = "," AND") */
        Sight.Station_ID = :old.Station_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Station because Sight exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/


CREATE  TRIGGER tI_Stay BEFORE INSERT ON Stay for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- INSERT trigger on Stay 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Sight  Stay on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f467", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Stay"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="Sight_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Sight
      WHERE
        /* %JoinFKPK(:%New,Sight," = "," AND") */
        :new.Sight_ID = Sight.Sight_ID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Stay because Sight does not exist.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tD_Stay AFTER DELETE ON Stay for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- DELETE trigger on Stay 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
    /* Stay  Room on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000da3d", PARENT_OWNER="", PARENT_TABLE="Stay"
    CHILD_OWNER="", CHILD_TABLE="Room"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="Stay_ID" */
    SELECT count(*) INTO NUMROWS
      FROM Room
      WHERE
        /*  %JoinFKPK(Room,:%Old," = "," AND") */
        Room.Stay_ID = :old.Stay_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Stay because Room exists.'
      );
    END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

CREATE  TRIGGER tU_Stay AFTER UPDATE ON Stay for each row
-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
-- UPDATE trigger on Stay 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Stay  Room on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001df37", PARENT_OWNER="", PARENT_TABLE="Stay"
    CHILD_OWNER="", CHILD_TABLE="Room"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="Stay_ID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.Stay_ID <> :new.Stay_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Room
      WHERE
        /*  %JoinFKPK(Room,:%Old," = "," AND") */
        Room.Stay_ID = :old.Stay_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Stay because Room exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM */
  /* Sight  Stay on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sight"
    CHILD_OWNER="", CHILD_TABLE="Stay"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="Sight_ID" */
  SELECT count(*) INTO NUMROWS
    FROM Sight
    WHERE
      /* %JoinFKPK(:%New,Sight," = "," AND") */
      :new.Sight_ID = Sight.Sight_ID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Stay because Sight does not exist.'
    );
  END IF;


-- ERwin Builtin Tuesday, November 4, 2014 6:50:53 PM
END;
/

