CREATE TABLE users(
    user_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    username varchar(50) NOT NULL UNIQUE,
    email varchar(100) NOT NULL UNIQUE,
    password_hash varchar(255) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE posts(
    post_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    title varchar(255) NOT NULL,
    content text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz DEFAULT now()
);

CREATE TABLE comments(
    comment_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    post_id uuid NOT NULL REFERENCES posts(post_id) ON DELETE CASCADE,
    user_id uuid NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    content text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS "public"."user_projects"(
    "id" "uuid" PRIMARY KEY DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "name" "text",
    "req_hyperparams_map" "json",
    "req_start_date" "date",
    "req_settings" "json",
    "req_model_id" "uuid",
    "user_id" "uuid" DEFAULT "auth"."uid"(),
    "req_source_id" "uuid"
);

CREATE TABLE IF NOT EXISTS "public"."projects"(
    "id" "uuid" NOT NULL PRIMARY KEY REFERENCES public.user_projects(id),
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "name" "text",
    "hyperparams_map" "json",
    "evaluation_criterias" "json",
    "start_date" "date",
    "last_executed_at" timestamp with time zone,
    "error_message" "text",
    "settings" "json",
    "source_id" "uuid"
);

