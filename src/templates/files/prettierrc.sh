create_prettierrc() {
  npm i -D prettier

  echo '
  {
    "semi": true,
    "singleQuote": false,
    "trailingComma": "all",
    "printWidth": 80,
    "tabWidth": 2,
    "useTabs": false,
    "arrowParens": "always"
  }' > .prettierrc
}
