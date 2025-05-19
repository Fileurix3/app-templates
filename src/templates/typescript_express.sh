#!/bin/sh
source /usr/local/share/templates/files/prettierrc.sh
source /usr/local/share/templates/files/nodemon.sh
source /usr/local/share/templates/files/eslint.sh
source /usr/local/share/templates/files/tsconfig.sh

project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i express dotenv
npm i -D @types/express


sed -i -E 's/"test":\s"echo.+$/"start": "node build\/index.js",/g' ./package.json
sed -i '/"start": "node build\/index.js",/a \    "build": "npx tsc",' package.json
sed -i '/"build": "npx tsc",/a \    "dev": "nodemon"' package.json

echo '.env
node_modules/
' > .gitignore

echo '' > .env

create_tsconfig
create_nodemon_ts
create_prettierrc
create_eslint_ts

mkdir src
cd src

echo 'import express from "express";
import "dotenv/config"

const app = express();

app.use(express.json());

const PORT = 3000;
app.listen(PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`Server was running on port: ${PORT}`);
});' > index.ts
