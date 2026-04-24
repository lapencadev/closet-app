CREATE TABLE IF NOT EXISTS items
(
    id           BIGSERIAL PRIMARY KEY,
    name         VARCHAR(150) NOT NULL,
    description  TEXT,
    colour       VARCHAR(20),
    season       VARCHAR(10),
    size         VARCHAR(10),
    image_url    VARCHAR(255),
    brand        VARCHAR(100),
    is_favourite BOOLEAN      NOT NULL DEFAULT FALSE,
    is_borrowed  BOOLEAN      NOT NULL DEFAULT FALSE,
    is_visible   BOOLEAN      NOT NULL DEFAULT TRUE,
    wardrobe_id  BIGINT       NOT NULL,
    created_at   TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at   TIMESTAMP,
    created_by   BIGINT,
    updated_by   BIGINT,
    CONSTRAINT fk_item_wardrobe FOREIGN KEY (wardrobe_id) REFERENCES wardrobes (id)
);
