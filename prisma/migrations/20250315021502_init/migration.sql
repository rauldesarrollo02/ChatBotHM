-- CreateEnum
CREATE TYPE "Option" AS ENUM ('CAPTURE', 'MENU', 'READ');

-- CreateEnum
CREATE TYPE "Rol" AS ENUM ('ADMIN', 'REDACTOR', 'EMPLEADO');

-- CreateEnum
CREATE TYPE "TypeMessage" AS ENUM ('NUMBER', 'NAME', 'NONE');

-- CreateTable
CREATE TABLE "messages" (
    "id" TEXT NOT NULL DEFAULT gen_random_uuid(),
    "deletedAt" TIMESTAMP(3) DEFAULT '9999-12-12 00:00:00 +00:00',
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "available" BOOLEAN NOT NULL DEFAULT true,
    "numOrder" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "option" "Option" NOT NULL,
    "typeMessage" "TypeMessage" NOT NULL DEFAULT 'NONE',
    "showName" BOOLEAN NOT NULL,
    "finishLane" BOOLEAN NOT NULL DEFAULT false,
    "trigger" TEXT,
    "enterpriseId" TEXT NOT NULL,
    "parentMessageId" TEXT,

    CONSTRAINT "messages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "enterprises" (
    "id" TEXT NOT NULL DEFAULT gen_random_uuid(),
    "deletedAt" TIMESTAMP(3) DEFAULT '9999-12-12 00:00:00 +00:00',
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "available" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "connected" BOOLEAN NOT NULL,

    CONSTRAINT "enterprises_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_enterpriseId_fkey" FOREIGN KEY ("enterpriseId") REFERENCES "enterprises"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_parentMessageId_fkey" FOREIGN KEY ("parentMessageId") REFERENCES "messages"("id") ON DELETE SET NULL ON UPDATE CASCADE;
