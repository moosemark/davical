
-- Sort out accessing calendar entries.

BEGIN;
SELECT check_db_revision(1,1,10);

ALTER TABLE calendar_item DROP CONSTRAINT "$1";
ALTER TABLE calendar_item ADD CONSTRAINT "$1" FOREIGN KEY (user_no) REFERENCES usr(user_no) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 
ALTER TABLE collection DROP CONSTRAINT "$1";
ALTER TABLE collection ADD CONSTRAINT "$1" FOREIGN KEY (user_no) REFERENCES usr(user_no) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;

SELECT new_db_revision(1,1,11, 'November' );
COMMIT;
ROLLBACK;

