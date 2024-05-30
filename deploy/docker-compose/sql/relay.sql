-- Create sequence for paymaster_apikey_id_seq
CREATE SEQUENCE paymaster_apikey_id_seq;

-- Create table for API keys
CREATE TABLE public.aastar_api_key_dev (
    id           INTEGER DEFAULT nextval('paymaster_apikey_id_seq'::regclass) NOT NULL,
    project_code VARCHAR(50),
    user_id      INTEGER,
    api_key      VARCHAR(255),
    key_name     VARCHAR(255),
    extra        JSON,
    created_at   TIMESTAMP DEFAULT NOW() NOT NULL,
    updated_at   TIMESTAMP,
    deleted_at   TIMESTAMP,
    disable      BOOLEAN DEFAULT FALSE NOT NULL,
    CONSTRAINT paymaster_apikey_pkey PRIMARY KEY (id)
);


CREATE INDEX paymaster_apikey_user_id_index
    ON public.aastar_api_key_dev (user_id);

-- Create sequence for paymaster_strategy_id_seq
CREATE SEQUENCE paymaster_strategy_id_seq;

-- Create table for strategies
CREATE TABLE public.aastar_strategy_dev (
    id                INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('paymaster_strategy_id_seq'::regclass),
    strategy_code     VARCHAR(255),
    project_code      VARCHAR(255),
    user_id           INTEGER,
    execute_restriction JSON NOT NULL DEFAULT '{}'::JSON,
    extra             JSON,
    strategy_name     VARCHAR(255) NOT NULL,
    created_at        TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at        TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    status            VARCHAR(20) NOT NULL DEFAULT 'disable',
    description       VARCHAR(500),
    deleted_at        TIMESTAMP WITHOUT TIME ZONE
);

CREATE UNIQUE INDEX paymaster_strategy_pk ON aastar_strategy_dev USING BTREE (strategy_code);
CREATE INDEX idx_user_id ON aastar_strategy_dev USING BTREE (user_id);

-- Create sequence for aastar_user_dev_id_seq
CREATE SEQUENCE aastar_user_dev_id_seq;

-- Create table for users
CREATE TABLE public.aastar_user_dev (
    id                INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('aastar_user_dev_id_seq'::regclass),
    created_at        TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at        TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    deleted_at        TIMESTAMP WITHOUT TIME ZONE,
    email             VARCHAR(255),
    password          VARCHAR(255),
    github_id         INTEGER,
    github_avatar_url VARCHAR(255),
    github_name       VARCHAR(255),
    github_login      VARCHAR(255),
    extra             JSON
);
