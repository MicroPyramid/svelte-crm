/*
  Warnings:

  - A unique constraint covering the columns `[session_id]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "User_session_id_key" ON "User"("session_id");
