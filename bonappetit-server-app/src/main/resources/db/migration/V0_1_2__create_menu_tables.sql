CREATE TABLE MENU (
  MENU_ID       BIGINT       NOT NULL AUTO_INCREMENT,
  TITLE         VARCHAR(255) NOT NULL,
  CREATION_TIME TIMESTAMP    NOT NULL,
  PRIMARY KEY (MENU_ID)
);

CREATE TABLE MENU_CONFIG (
  MENU_CONFIG_ID BIGINT NOT NULL AUTO_INCREMENT,
  MENU_ID        BIGINT NOT NULL,
  PRIMARY KEY (MENU_CONFIG_ID),
  FOREIGN KEY (MENU_ID) REFERENCES MENU (MENU_ID)
);

CREATE TABLE ITEM (
  ITEM_ID BIGINT         NOT NULL AUTO_INCREMENT,
  PRICE   DECIMAL(19, 2) NOT NULL,
  TITLE   VARCHAR(255)   NOT NULL,
  TYPE    INTEGER        NOT NULL,
  MENU_ID BIGINT         NOT NULL,
  PRIMARY KEY (ITEM_ID),
  FOREIGN KEY (MENU_ID) REFERENCES MENU (MENU_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE ITEM_OPTION (
  OPTION_ID                      BIGINT       NOT NULL AUTO_INCREMENT,
  OPTION_TYPE                    VARCHAR(255) NOT NULL,
  OPTION_INDEX                   INTEGER      NOT NULL,
  TITLE                          VARCHAR(255) NOT NULL,
  DEFAULT_CHECKED                BOOLEAN,
  PRICE_DIFF                     DECIMAL(19, 2),
  DEFAULT_VALUE                  INTEGER,
  DEFAULT_SELECTED_RADIO_ITEM_ID BIGINT,
  ITEM_ID                        BIGINT,
  PRIMARY KEY (OPTION_ID),
  FOREIGN KEY (ITEM_ID) REFERENCES ITEM (ITEM_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE RADIO_ITEM (
  RADIO_ITEM_ID    BIGINT         NOT NULL AUTO_INCREMENT,
  RADIO_ITEM_INDEX INTEGER        NOT NULL,
  PRICE_DIFF       DECIMAL(19, 2) NOT NULL,
  TITLE            VARCHAR(255)   NOT NULL,
  OPTION_ID        BIGINT         NOT NULL,
  PRIMARY KEY (RADIO_ITEM_ID),
  FOREIGN KEY (OPTION_ID) REFERENCES ITEM_OPTION (OPTION_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Add foreign key constraint to ITEM_OPTION. This can not be performed when creating the ITEM_OPTION table because
-- of a reference cycle between ITEM_OPTION and RADIO_ITEM.
ALTER TABLE ITEM_OPTION ADD FOREIGN KEY (DEFAULT_SELECTED_RADIO_ITEM_ID) REFERENCES RADIO_ITEM (RADIO_ITEM_ID);
