#! /bin/bash

command yarn add ts-node typescript nodemon @types/node -D
command yarn add dotenv

if [ ! -f "./tsconfig.json" ]; then
    echo "create tsconfig.json."
    npx tsc --init --rootDir src --outDir lib --esModuleInterop --resolveJsonModule --lib es6,dom --module commonjs
fi

if [ ! -d "./src" ]; then
    echo "create src directory."
    mkdir src
fi

if [ ! -f "./src/index.ts" ]; then
    echo "create index.ts under src directory."
    touch ./src/index.ts
fi

if [ ! -s "./src/index.ts" ]; then
    echo "write main function in index.ts"
    echo "function main() {" >>./src/index.ts
    echo " console.log(\"hello\");" >>./src/index.ts
    echo "}" >>./src/index.ts
    echo "" >>./src/index.ts
    echo "main()" >>./src/index.ts
fi
