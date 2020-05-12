# examples of building node using pants

NOTE: THIS IS A WIP, THINGS MAY NOT WORK CURRENTLY

hopefully this can help you take a gander into some examples provided from the pants source code and others i have added for example.

it is quite cumbersome to get going, with many *undocumented* things so this is a decent reference for now.  hopefully i/someone can update the real docs to cover some of this.

### things not documented/obvious
- using `[node-distribution]` settings in your pants.ini to control node version. had to look through source code and take some random guesses to get this going.

- you _have_ to `package_manager='yarn'` on a `node_module` goals to have it run npm install on your `dependencies` in your package.json file.

- it would appear `node_module` goals that don't have a matching name as what is in their package.json file will not install any `dependencies` from package.json, regardless of if yarn is used.

- a `node_module` goal that has a `build_script` property set _has_ to create a directory named `dist` with something in it to pass. example command in this repo is `./pants compile src/node/create-react-app:built-site`, you can see it calls a special build that moves a folder created by `create-react-app` called `build` to `dist`.

- what pants command go to what goals

- it does not seem you can use scoped npm packages for `node_remote_package` as the @ sign throws errors.

### examples
just some documentation on the examples.
#### create-react-app
this app was created with `create-react-app` tool.  no changes were made to the source code. see the `src/node/create-react-app/BULID` file for reference to how to build.

you can run unit tests with
```bash
./pants test src/node/create-react-app:unit
```
you can create the website and find it in the `dist` root folder tar and gunziped
```bash
./pants bundle src/node/create-react-app:website
```