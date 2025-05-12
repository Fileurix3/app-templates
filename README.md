# CLI for creating project template

**Only support nodejs templates, but i may add other languages and templates in the future.**

CLI application that automatically generates a start template for projects so that you don't have to do it manually all the time.

## Install

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Fileurix3/app_templates.git
   ```

2. **Navigate to the Project Folder**

   ```bash
   cd app_templates
   ```

3. **Install project**

   ```bash
   sudo make install
   ```

## Uninstall

1. **Navigate to the Project Folder**

   ```bash
   cd app_templates
   ```

2. **Remove CLI**

   ```bash
   sudo make uninstall
   ```

3. **Remove folder with this project**
   ```bash
   rm -rf app_templates
   ```

## How to use it?

1. Enter `appt` in terminal.
2. Enter your project name.
3. Choice your language.
4. Choice your framework.

## What templates does this CLI support? <a id="templates"></a>

- **TypeScript:**
  - **Vanila**: Vanila TypeScript without frameworks
  - **Express**: Express project with TypeScript
- **JavaScript:**
  - **Express**: Express project with JavaScript
