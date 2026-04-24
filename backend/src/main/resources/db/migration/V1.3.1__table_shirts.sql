CREATE TABLE IF NOT EXISTS shirts
(
    id BIGINT PRIMARY KEY REFERENCES clothes(id) ON DELETE CASCADE,
    sleeve_length VARCHAR(20),
    fit_type      VARCHAR(50)
);