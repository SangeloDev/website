<script>
	import IconOpenInNew from 'svelte-material-icons/OpenInNew.svelte';
    let projectLogo = "assets/logos/sangelo.svg";
    let projectReadme = "https://gitpot.dev/sangelo/website/raw/branch/main/README.md";
    let projectSite = "https://gitpot.dev/sangelo/website";
</script>

<content>
	<div class="parent">
        <div class="gallery">
            <img src="{projectLogo}" class="project-logo" alt="Project Logo" />
		</div>
		<div>
			<zero-md class="markdown" src="{projectReadme}">
				<template>
                    <link
                        rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.4.0/github-markdown-dark.min.css"
                    />
					<link
						rel="stylesheet"
						href="https://cdnjs.cloudflare.com/ajax/libs/prism-themes/1.9.0/prism-atom-dark.min.css"
					/>
                    <link
                        rel="stylesheet"
                        href="/assets/style/markdown.css"
                    />
				</template>
			</zero-md>
		</div>
	</div>
	<div class="button-container">
		<a
			class="button"
			target="_blank"
			rel="noopener noreferrer"
			href="{projectSite}"
			tabindex="-1"
			><button>
				<IconOpenInNew size="1.2em" />
				<p>Visit Project</p>
			</button>
		</a>
	</div>
</content>

<style lang="scss">
	@import '../../styles/modal.scss';
	@import '../../styles/mobile/modal-mobile.scss';
</style>
