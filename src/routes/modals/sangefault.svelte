<script>
	import IconOpenInNew from 'svelte-material-icons/OpenInNew.svelte';
    let projectLogo = "assets/logos/sangefault.svg";
    let projectReadme = "https://gitpot.dev/sangelo/SangeFault/raw/branch/1.8.9/README.md";
    let projectSite = "https://github.com/SangeloDev/SangeFault";
</script>

<content>
	<div class="parent">
        <div class="gallery">
            <img src="{projectLogo}" class="project-logo" alt="Project Logo" />
		</div>
		<div class="content">
			<zero-md src="{projectReadme}">
				<template>
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
