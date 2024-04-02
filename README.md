# Sangelo's Space

This is the source-code for my website, written in Svelte & SCSS.<br>
Feel free to explore!

## Contributing

You're welcome to contribute to this website if you have a Lunivity account (see homepage for details if registrations aren't open).<br>
Once you fork and clone the repository, follow the next steps.

If you have `just` installed, setting up is pretty easy:

```bash
# setup dependencies and run dev server
just

# you can also run `just dev`
just dev

# to build and preview a webpage, run `just preview`
just preview
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

To create a production version of this website without docker:

```bash
yarn run build
```

To build a docker container image with `just`:

```bash
# build and run container image with docker
just build

# build with podman
just build podman

# clean, build, and run container image with docker or podman
just all
just all podman
```

You can preview the production build with `yarn run preview`.

## License

You can view this project's source code license [here](./LICENSE).

All assets (images, logos, etc.) created by me (Sangelo) are Copyright (c) 2019-2024 Sangelo unless otherwise stated.<br>
Brand logos and icons (such as Discord, Github, YouTube, etc.) are trademarked by and copyright of their respective owners.
