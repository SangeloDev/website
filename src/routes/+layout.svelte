<script>
	import '../app.scss';
	import Navbar from './Navbar.svelte';

	import { fly } from 'svelte/transition';
	export let data;
</script>

{#key data.pathname}
	<main in:fly={{ x: 10, duration: 250, delay: 250 }} out:fly={{ x: -5, duration: 250 }}>
		<slot />
	</main>
{/key}
