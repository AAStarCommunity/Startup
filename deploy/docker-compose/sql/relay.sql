create table public.aastar_api_key_dev
(
    id           integer   default nextval('paymaster_apikey_id_seq'::regclass) not null
        constraint paymaster_apikey_pkey
            primary key,
    project_code varchar(50),
    user_id      integer,
    api_key      varchar(255),
    key_name     varchar(255),
    extra        json,
    created_at   timestamp default now()                                        not null,
    updated_at   timestamp,
    deleted_at   timestamp,
    disable      boolean   default false                                        not null
);

alter table public.aastar_api_key_dev
    owner to postgres;

create index paymaster_apikey_user_id_index
    on public.aastar_api_key_dev (user_id);





create table public.aastar_strategy_dev (
  id integer primary key not null default nextval('paymaster_strategy_id_seq'::regclass),
  strategy_code character varying(255),
  project_code character varying(255),
  user_id integer,
  execute_restriction json not null default '{}'::json,
  extra json,
  strategy_name character varying(255) not null,
  created_at timestamp without time zone not null default now(),
  updated_at timestamp without time zone not null default now(),
  status character varying(20) not null default 'disable',
  description character varying(500),
  deleted_at timestamp without time zone
);
create unique index paymaster_strategy_pk on aastar_strategy_dev using btree (strategy_code);
create index idx_user_id on aastar_strategy_dev using btree (user_id);


create table public.aastar_user_dev (
  id integer primary key not null default nextval('aastar_user_dev_id_seq'::regclass),
  created_at timestamp without time zone not null default now(),
  updated_at timestamp without time zone not null default now(),
  deleted_at timestamp without time zone,
  email character varying(255),
  password character varying(255),
  github_id integer,
  github_avatar_url character varying(255),
  github_name character varying(255),
  github_login character varying(255),
  extra json
);