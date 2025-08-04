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
CREATE TABLE "configuration" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" bigint NOT NULL,
    "customerId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "lastModified" timestamp without time zone NOT NULL,
    "isDeleted" boolean NOT NULL DEFAULT false,
    "group" text NOT NULL,
    "key" text NOT NULL,
    "value" text NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "configuration"
    ADD CONSTRAINT "configuration_fk_0"
    FOREIGN KEY("customerId")
    REFERENCES "customer"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR t2
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('t2', '20250804101246888', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250804101246888', "timestamp" = now();

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
