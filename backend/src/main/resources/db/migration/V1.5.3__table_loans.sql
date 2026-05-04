CREATE TABLE IF NOT EXISTS loans
(
    id            BIGSERIAL PRIMARY KEY,
    date_loaned   DATE,
    date_returned DATE,
    is_returned   BOOLEAN,
    borrower_name VARCHAR(255),
    item_id       BIGINT    NOT NULL,
    owner_id      BIGINT    NOT NULL,
    created_at    TIMESTAMP NOT NULL DEFAULT now(),
    updated_at    TIMESTAMP,
    created_by    BIGINT,
    updated_by    BIGINT,
    CONSTRAINT fk_loan_item FOREIGN KEY (item_id) REFERENCES items (id),
    CONSTRAINT fk_loan_owner FOREIGN KEY (owner_id) REFERENCES users (id)
);