DROP TABLE gift_catalog;
/

Create or Replace TYPE gifts_type is TABLE OF VARCHAR2(20);

/

CREATE TABLE gift_catalog (gift_id INTEGER PRIMARY KEY, min_purchase NUMBER, gifts gifts_type)
NESTED TABLE gifts STORE AS Gift_tab;

/

INSERT INTO GIFT_CATALOG Values (1, 100, gifts_type('Stickers', 'Pens', 'Candy'));
INSERT INTO GIFT_CATALOG Values (2, 500, gifts_type('Art Supplies', 'Craft Supplies', 'Chocolate Box'));
INSERT INTO GIFT_CATALOG Values (3, 1000, gifts_type('Teddy Bear', 'Train Set'));

/
COMMIT;