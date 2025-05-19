create_eslint_js(){
  npm i -D eslint eslint-config-prettier eslint-plugin-prettier @eslint/js globals

  echo 'import js from "@eslint/js";
    import globals from "globals";
    import { defineConfig } from "eslint/config";

    export default defineConfig([
    {
      files: ["**/*.{js,mjs,cjs}"],
      plugins: { js },
      extends: ["js/recommended"],
      rules: {
        "no-unused-vars": "warn",
        "no-undef": "warn",
        "no-console": "warn",
        eqeqeq: "warn",
      },
    },
    { files: ["**/*.{js,mjs,cjs}"], languageOptions: { globals: globals.node } },
  ]);' > eslint.config.js
}

create_eslint_ts(){
  npm i -D eslint eslint-config-prettier eslint-plugin-prettier @eslint/js globals typescript-eslint

  echo 'import js from "@eslint/js";
    import globals from "globals";
    import tseslint from "typescript-eslint";
    import { defineConfig } from "eslint/config";

    export default defineConfig([
      {
        files: ["**/*.{js,mjs,cjs,ts}"],
        plugins: { js },
        extends: ["js/recommended"],
        rules: {
          "no-unused-vars": "warn",
          "no-undef": "warn",
          "no-console": "warn",
          eqeqeq: "warn",
        },
      },
      {
        files: ["**/*.{js,mjs,cjs,ts}"],
        languageOptions: { globals: globals.node },
      },
    tseslint.configs.recommended,
  ]);' > eslint.config.mjs
}
