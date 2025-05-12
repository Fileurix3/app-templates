import { exec } from "child_process";
import inquirer from "inquirer";

export async function startCli() {
  const projectName = await enterProjectName();
  const language = await choiceLanguage();
  const framework = await choiceFramework(language);

  console.log("Project creating...");
  return createProject(projectName, language, framework);
}

async function enterProjectName() {
  const projectName = await inquirer.prompt([
    {
      type: "input",
      name: "name",
      message: "Enter project name",
      validate: (name) => {
        if (name.trim() == "") {
          return "The name can't be empty";
        }
        return true;
      },
    },
  ]);

  return projectName.name;
}

async function choiceLanguage() {
  const language = await inquirer.prompt([
    {
      type: "list",
      name: "languages",
      message: "Choice a language",
      choices: ["JavaScript", "TypeScript"],
    },
  ]);

  return language.languages;
}

async function choiceFramework(language) {
  let framework;

  if (language == "JavaScript") {
    framework = await inquirer.prompt([
      {
        type: "list",
        name: "framework",
        message: "Choice a framework",
        choices: ["Express"],
      },
    ]);
  } else if (language == "TypeScript") {
    framework = await inquirer.prompt([
      {
        type: "list",
        name: "framework",
        message: "Choice a framework",
        choices: ["Vanilla", "Express"],
      },
    ]);
  }

  return framework.framework;
}

function createProject(projectName, language, framework) {
  const templatesPath = "/usr/local/share/templates";

  exec(
    `${templatesPath}/${language.toLowerCase()}_${framework.toLowerCase()}.sh ${projectName}`,
    (err, stdout, stderr) => {
      if (err) {
        console.error("Error when creating a projecta");
        if (stderr) {
          console.error(stderr);
        }
        process.exit(1);
      } else {
        console.log("Project has been successfully created");
        console.log(stdout);
      }
    },
  );
}
