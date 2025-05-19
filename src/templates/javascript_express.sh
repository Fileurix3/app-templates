#!/bin/sh
source /usr/local/share/templates/files/prettierrc.sh
source /usr/local/share/templates/files/nodemon.sh
source /usr/local/share/templates/files/eslint.sh

project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i express dotenv

sed -i '/"main":/a\  "type": "module",' ./package.json
sed -i -E 's/"test":\s"echo.+$/"start": "node src\/index.js",/g' ./package.json
sed -i '/"start": "node src\/index.js",/a \    "dev": "nodemon"' ./package.json

echo 'node_modules/
.env
' > .gitignore

echo '' > .env

create_nodemon_js
create_prettierrc
create_eslint_js

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
});' > index.js
