CREATE TABLE AP_ITEMS (
  ID      BIGINT PRIMARY KEY AUTO_INCREMENT,
  AP_ID   BIGINT NOT NULL,
  ITEM_ID BIGINT NOT NULL,
  FOREIGN KEY (AP_ID) REFERENCES APS (ID),
  FOREIGN KEY (ITEM_ID) REFERENCES ITEMS (ID)
);

INSERT INTO AP_ITEMS (AP_ID, ITEM_ID) SELECT AP_ID, ID FROM ITEMS WHERE ITEMS.AP_ID IS NOT NULL;
ALTER TABLE ITEMS DROP FOREIGN KEY items_ibfk_1;
ALTER TABLE ITEMS DROP COLUMN AP_ID;


CREATE TABLE AR_ITEMS (
  ID      BIGINT PRIMARY KEY AUTO_INCREMENT,
  AR_ID   BIGINT NOT NULL,
  ITEM_ID BIGINT NOT NULL,
  FOREIGN KEY (AR_ID) REFERENCES ARS (ID),
  FOREIGN KEY (ITEM_ID) REFERENCES ITEMS (ID)
);

INSERT INTO AR_ITEMS (AR_ID, ITEM_ID) SELECT AR_ID, ID FROM ITEMS WHERE ITEMS.AR_ID IS NOT NULL;
ALTER TABLE ITEMS DROP FOREIGN KEY items_ibfk_2;
ALTER TABLE ITEMS DROP COLUMN AR_ID;