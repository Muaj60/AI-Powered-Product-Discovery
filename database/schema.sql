-- AI-Powered Product Discovery: PostgreSQL schema (CSE4104-7C-T10)
-- Matches the ER Diagram in the System Design Document.

CREATE TABLE admin (
    admin_id      SERIAL PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    email         VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at    TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE source (
    source_id    SERIAL PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    base_url     VARCHAR(255) NOT NULL,
    access_type  VARCHAR(20) NOT NULL,          -- scraping, feed, or sample
    is_permitted BOOLEAN NOT NULL DEFAULT TRUE,
    status       VARCHAR(20) NOT NULL DEFAULT 'enabled'
);

CREATE TABLE product (
    product_id   SERIAL PRIMARY KEY,
    category_id  INT NOT NULL REFERENCES category(category_id),
    source_id    INT NOT NULL REFERENCES source(source_id),
    name         VARCHAR(255) NOT NULL,
    brand        VARCHAR(100),
    price        NUMERIC(12,2) NOT NULL,
    currency     VARCHAR(5) NOT NULL DEFAULT 'BDT',
    product_url  VARCHAR(500) NOT NULL,
    image_url    VARCHAR(500),
    last_updated TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE product_spec (
    spec_id          SERIAL PRIMARY KEY,
    product_id       INT NOT NULL REFERENCES product(product_id) ON DELETE CASCADE,
    spec_name        VARCHAR(50) NOT NULL,       -- e.g. ram, storage, screen_size
    spec_value       VARCHAR(100) NOT NULL,      -- original text, e.g. 16 GB
    normalized_value NUMERIC,                    -- e.g. 16
    unit             VARCHAR(20)                 -- e.g. GB
);

-- Future enhancement
CREATE TABLE price_history (
    price_id    SERIAL PRIMARY KEY,
    product_id  INT NOT NULL REFERENCES product(product_id) ON DELETE CASCADE,
    price       NUMERIC(12,2) NOT NULL,
    recorded_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE search_query (
    query_id           SERIAL PRIMARY KEY,
    query_text         TEXT NOT NULL,
    category           VARCHAR(50),
    budget_min         NUMERIC(12,2),
    budget_max         NUMERIC(12,2),
    extracted_criteria JSONB,
    result_count       INT,
    created_at         TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE recommendation (
    recommendation_id SERIAL PRIMARY KEY,
    query_id          INT NOT NULL REFERENCES search_query(query_id) ON DELETE CASCADE,
    product_id        INT NOT NULL REFERENCES product(product_id) ON DELETE CASCADE,
    rank_position     INT NOT NULL,
    match_score       NUMERIC(5,2),
    explanation       TEXT
);

CREATE TABLE scrape_job (
    job_id            SERIAL PRIMARY KEY,
    source_id         INT NOT NULL REFERENCES source(source_id),
    admin_id          INT NOT NULL REFERENCES admin(admin_id),
    status            VARCHAR(20) NOT NULL DEFAULT 'pending',
    records_collected INT DEFAULT 0,
    started_at        TIMESTAMP,
    finished_at       TIMESTAMP
);

CREATE TABLE activity_log (
    log_id      SERIAL PRIMARY KEY,
    admin_id    INT REFERENCES admin(admin_id),
    event_type  VARCHAR(50) NOT NULL,
    description TEXT,
    created_at  TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Indexes for fast search, filter, and comparison
CREATE INDEX idx_product_category_price ON product(category_id, price);
CREATE INDEX idx_product_spec_lookup    ON product_spec(product_id, spec_name);
CREATE INDEX idx_search_query_created   ON search_query(created_at);
