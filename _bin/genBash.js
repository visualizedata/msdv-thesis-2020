const fs = require('fs')
const path = require('path')

let students = fs.readFileSync(path.resolve(__dirname,'..','students.json'), {encoding: 'UTF-8'})
students = JSON.parse(students)

let script = `#!/bin/bash
`

let readme = `### MS Data Visualization / Thesis 2020

`

const pushStudent = ({IAM, Repository, name}, index) => {
  let folder = IAM.replace(/@newschool.edu/g,'')
  let git = Repository

  script += `
FOLDER_NAME[${index}]="${folder}"
GIT_PATH[${index}]="${git}"
`

  readme += `* [${name} (${folder})](${git}) / [demo.mp4](${git}/raw/master/demo.mp4)
![](${git}/raw/master/preview.png)
`
}

students.forEach(pushStudent)

//"${FOLDER_NAME[@]}"

script += `
echo "This script will"
echo "* Make ${students.length} repositories"
echo "* Inside of $(pwd)"
echo ""
echo "Would you like to continue?"

read -p "(Y/N) " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo ""

for i in {0..${students.length-1}}; do
  # nicer file variables
  TEMP_FOLDER="\$\{FOLDER_NAME[$i]\}"
  TEMP_GIT="\$\{GIT_PATH[$i]\}"

  # create submodules for each student
  echo "creating:" $TEMP_FOLDER "..."

  git submodule add $TEMP_GIT $TEMP_FOLDER
done

echo "done!"
`

// fs.writeFileSync(
//   path.resolve(__dirname, 'createSubmodules.sh'),
//   script,
//   {encoding: 'UTF-8'}
// )
fs.writeFileSync(
  path.resolve(__dirname, '..', 'readme.md'),
  readme,
  {encoding: 'UTF-8'}
)
