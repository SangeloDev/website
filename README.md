# Sangelo's Space

This is the source-code for my website, written in Svelte & SCSS.<br>
Feel free to explore!

## Contributing

You're welcome to contribute to this website if you have a Lunivity account (see Gitpot's homepage for details if registrations aren't open).<br>
Once you fork and clone the repository, follow the next steps.

If you have [`just`](https://github.com/casey/just/) installed, setting up is pretty easy:

```bash
# setup dependencies and run dev server
just

# you can also run `just dev`
just dev
```

View a list of all possible `just` recipes with `just -l`.

Otherwise, if you don't already have or don't want to install `just`, you can run the commands manually:

```bash
# install dependencies
yarn install

# run web dev server
yarn run dev

# or start the server and open the app in a new browser tab
yarn run dev --open
```

Once you've made your changes, you can create a Pull Request and I'll make sure to check it out!

## Building

### Build locally

To create a production version of this website without docker:

```bash
# automatically build & preview
just preview

# or, manually build
yarn run build
```

You can then preview the production build locally with `yarn run preview --open`.

The files will be available in the repo, in the `build/` directory.

### Build with Docker

To build a docker container image with `just`:

```bash
# build and run container image with docker, tag: latest
just build

# build with podman
just build <tag> podman

# clean, build, and run container image with docker, tag: latest
just all
# clean, build, and run container image with podman, tag: dev
just all dev podman
```

You can preview the produced docker build with `just run [tag] [runner]`.

## License

You can view this project's source code license [here](./LICENSE).

All assets (images, logos, etc.) created by me (Sangelo) are Copyright (c) 2019-2024 Sangelo unless otherwise stated.<br>
Brand logos and icons (such as Discord, Github, YouTube, etc.) are trademarked by and copyright of their respective owners.
