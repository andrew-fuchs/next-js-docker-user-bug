This repo was made to replicate a bug which involves Next.js (10.0.7),
Docker, and Unix permissions.

## Steps to replicate

  1. Create a Next.js project and a Dockerfile that uses the `USER`
     command such that the project's files will be owned by root:root in
     the image (already done in this repo).
  2. Build the Docker image (`docker build -t bugreplication .`)
  3. When Docker runs `npm run build` it should fail with the error:

    #13 5.605 Failed to compile.
    #13 5.605
    #13 5.605 ./styles/globals.css
    #13 5.605 Global CSS cannot be imported from files other than your Custom <App>. Please move all global CSS imports to pages/_app.js. Or convert the import to Component-Level CSS (CSS Modules).
    #13 5.605 Read more: https://err.sh/next.js/css-global
    #13 5.605 Location: pages/_app.js
    #13 5.605
    #13 5.605
    #13 5.605 > Build error occurred
    #13 5.607 Error: > Build failed because of webpack errors
    #13 5.607     at /home/bugreplication/node_modules/next/dist/build/index.js:15:918
    #13 5.607     at async /home/bugreplication/node_modules/next/dist/build/tracer.js:3:470
