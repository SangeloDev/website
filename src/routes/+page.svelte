<script lang="ts">

	import Home from '$lib/components/Home.svelte';
	import About from '$lib/components/About.svelte';
	import Projects from '$lib/components/Projects.svelte';
	import Socials from '$lib/components/Socials.svelte';

</script>

<div class="container">
	<Home />
	<About />
	<Projects />
	<Socials />
</div>

<style lang="scss">
	@import '$styles/index.scss';
</style>