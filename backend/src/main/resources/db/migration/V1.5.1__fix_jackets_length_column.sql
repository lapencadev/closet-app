-- jackets.length was auto-created by Hibernate as SMALLINT with a CHECK constraint
-- because the Flyway migration for jackets didn't define this column.
-- This script is idempotent: only converts the column if it is still SMALLINT.
ALTER TABLE jackets DROP CONSTRAINT IF EXISTS jackets_length_check;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'jackets'
          AND column_name = 'length'
          AND data_type = 'smallint'
    ) THEN
        ALTER TABLE jackets
            ALTER COLUMN "length" TYPE VARCHAR(20)
            USING CASE "length"
                WHEN 0 THEN 'SHORT'
                WHEN 1 THEN 'MEDIUM'
                WHEN 2 THEN 'LONG'
                ELSE NULL
            END;
    END IF;
END $$;