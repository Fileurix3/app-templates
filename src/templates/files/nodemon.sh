create_nodemon_ts() {
  npm i -D nodemon

  echo '{
    "watch": ["src"],
    "ext": "ts",
    "exec": "npx tsx src/index.ts"
  }' > nodemon.json
}

create_nodemon_js() {
  npm i -D nodemon

  echo '{
    "watch": ["src"],
    "ext": "js",
    "exec": "node src/index.js"
  }' > nodemon.json
}
