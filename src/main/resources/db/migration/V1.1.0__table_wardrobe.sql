CREATE TABLE IF NOT EXISTS wardrobes
(
    id           BIGSERIAL PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    description  TEXT,
    image_url    VARCHAR(255),
    location     VARCHAR(100),
    is_favourite BOOLEAN      NOT NULL DEFAULT FALSE,
    is_visible   BOOLEAN      NOT NULL DEFAULT TRUE,
    user_id      BIGINT       NOT NULL,
    created_at   TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at   TIMESTAMP,
    created_by   BIGINT,
    updated_by   BIGINT,
    CONSTRAINT fk_wardrobe_user FOREIGN KEY (user_id) REFERENCES users (id)
);