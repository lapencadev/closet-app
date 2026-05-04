-- Several Flyway migrations were incomplete: Hibernate auto-added the missing columns/tables
-- via ddl-auto=update. Now that ddl-auto=validate is used, these must be explicit.
-- All statements are idempotent (IF NOT EXISTS).

-- footwear: V1.3.8 incorrectly created 'jackets' instead of 'footwear'
CREATE TABLE IF NOT EXISTS footwear
(
    id   BIGINT PRIMARY KEY REFERENCES clothes(id) ON DELETE CASCADE,
    type VARCHAR(255)
);

-- skirts: migration only had 'length' and 'style'; entity has sleevLength and fitType
ALTER TABLE skirts
    ADD COLUMN IF NOT EXISTS sleeve_length VARCHAR(255),
    ADD COLUMN IF NOT EXISTS fit_type      VARCHAR(255);

-- pants: migration was missing waist_size
ALTER TABLE pants
    ADD COLUMN IF NOT EXISTS waist_size VARCHAR(255);