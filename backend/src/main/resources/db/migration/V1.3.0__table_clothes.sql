CREATE TABLE IF NOT EXISTS clothes
(
    id BIGINT NOT NULL PRIMARY KEY,
    fabric_type VARCHAR(50),
    pattern     VARCHAR(50),
    CONSTRAINT fk_clothes_item FOREIGN KEY (id) REFERENCES items (id) ON DELETE CASCADE
);