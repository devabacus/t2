BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "role" DROP CONSTRAINT "role_fk_0";
ALTER TABLE "role" DROP COLUMN "customerId";

--
-- MIGRATION VERSION FOR t2
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('t2', '20250812044012796', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250812044012796', "timestamp" = now();

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
