-- The jackets Flyway migration (V1.3.7) did not define a 'length' column.
-- Hibernate auto-created it as SMALLINT (ordinal enum) in environments where
-- ddl-auto=update was active. This migration normalises the column to VARCHAR(20)
-- to match @Enumerated(EnumType.STRING) and the rest of the clothes tables.
-- Idempotent: handles a missing column, a SMALLINT column, or an already-correct VARCHAR column.

ALTER TABLE jackets DROP CONSTRAINT IF EXISTS jackets_length_check;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'jackets' AND column_name = 'length'
    ) THEN
        -- Fresh database (CI): column was never created by Flyway, add it now.
        ALTER TABLE jackets ADD COLUMN "length" VARCHAR(20);

    ELSIF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'jackets' AND column_name = 'length' AND data_type = 'smallint'
    ) THEN
        -- Existing database: column was auto-created by Hibernate as SMALLINT ordinal.
        ALTER TABLE jackets
            ALTER COLUMN "length" TYPE VARCHAR(20)
            USING CASE "length"
                WHEN 0 THEN 'SHORT'
                WHEN 1 THEN 'MEDIUM'
                WHEN 2 THEN 'LONG'
                ELSE NULL
            END;

    -- ELSE: column already exists as VARCHAR — nothing to do.
    END IF;
END $$;