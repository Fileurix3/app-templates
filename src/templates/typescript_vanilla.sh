#!/bin/sh
source /usr/local/share/templates/files/prettierrc.sh
source /usr/local/share/templates/files/eslint.sh
source /usr/local/share/templates/files/tsconfig.sh

project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i

sed -i -E 's/"test":\s"echo.+$/"start": "node build\/index.js",/g' ./package.json
sed -i '/"start": "node build\/index.js",/a \    "build": "npx tsc",' package.json
sed -i '/"build": "npx tsc",/a \    "dev": "npx tsx src/index.ts"' package.json

create_tsconfig
create_prettierrc
create_eslint_ts

mkdir src
cd src

touch index.ts
