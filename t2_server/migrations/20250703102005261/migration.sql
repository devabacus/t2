BEGIN;

--
-- Function: gen_random_uuid_v7()
-- Source: https://gist.github.com/kjmph/5bd772b2c2df145aa645b837da7eca74
-- License: MIT (copyright notice included on the generator source code).
--
create or replace function gen_random_uuid_v7()
returns uuid
as $$
begin
  -- use random v4 uuid as starting point (which has the same variant we need)
  -- then overlay timestamp
  -- then set version 7 by flipping the 2 and 1 bit in the version 4 string
  return encode(
    set_bit(
      set_bit(
        overlay(uuid_send(gen_random_uuid())
                placing substring(int8send(floor(extract(epoch from clock_timestamp()) * 1000)::bigint) from 3)
                from 1 for 6
        ),
        52, 1
      ),
      53, 1
    ),
    'hex')::uuid;
end
$$
language plpgsql
volatile;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "category" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "isDeleted" boolean NOT NULL DEFAULT false,
    "lastModified" timestamp without time zone,
    "userId" bigint NOT NULL,
    "title" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tag" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "isDeleted" boolean NOT NULL DEFAULT false,
    "lastModified" timestamp without time zone,
    "userId" bigint NOT NULL,
    "title" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "task" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "isDeleted" boolean NOT NULL DEFAULT false,
    "lastModified" timestamp without time zone,
    "userId" bigint NOT NULL,
    "title" text NOT NULL,
    "categoryId" uuid,
    "category" json
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "task_tag_map" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "taskId" uuid NOT NULL,
    "tagId" uuid NOT NULL,
    "userId" bigint NOT NULL,
    "lastModified" timestamp without time zone,
    "isDeleted" boolean NOT NULL DEFAULT false,
    "_tagTasktagmapsTagId" uuid,
    "_taskTasktagmapsTaskId" uuid
);

-- Indexes
CREATE UNIQUE INDEX "task_tag_map_unique_idx" ON "task_tag_map" USING btree ("taskId", "tagId", "userId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "task"
    ADD CONSTRAINT "task_fk_0"
    FOREIGN KEY("categoryId")
    REFERENCES "category"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "task_tag_map"
    ADD CONSTRAINT "task_tag_map_fk_0"
    FOREIGN KEY("taskId")
    REFERENCES "task"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "task_tag_map"
    ADD CONSTRAINT "task_tag_map_fk_1"
    FOREIGN KEY("tagId")
    REFERENCES "tag"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "task_tag_map"
    ADD CONSTRAINT "task_tag_map_fk_2"
    FOREIGN KEY("_tagTasktagmapsTagId")
    REFERENCES "tag"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "task_tag_map"
    ADD CONSTRAINT "task_tag_map_fk_3"
    FOREIGN KEY("_taskTasktagmapsTaskId")
    REFERENCES "task"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR t2
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('t2', '20250703102005261', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250703102005261', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
