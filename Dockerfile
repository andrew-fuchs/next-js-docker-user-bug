FROM node:15.11.0-alpine3.11

ENV PORT=3000
EXPOSE ${PORT}

WORKDIR /home/bugreplication/

# create a new user and set up permissions on the working directory
RUN addgroup -S bugreplication
RUN adduser -h /home/bugreplication/ -s /bin/false -G bugreplication -S -D -H bugreplication
RUN chown bugreplication:bugreplication /home/bugreplication/
# run programs as the `bugreplication` user and `bugreplication` group
USER bugreplication:bugreplication

# only copy `package.json` for `npm install`, since npm won't be able to
# write to a root:root owned `package-lock.json`
COPY package.json .
RUN npm install

# This copies the files into the image. The owner of the copied files
# will be root:root unless the `--chown=user:user` argument is added to
# the `COPY` command
COPY . .

# this will fail
RUN npm run build

ENTRYPOINT [ "npm", "run", "start" ]
