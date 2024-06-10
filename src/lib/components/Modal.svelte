<script lang="ts">
	import { fade, fly } from 'svelte/transition';
	import type { SvelteComponent } from 'svelte';
	import { onMount, onDestroy, createEventDispatcher } from 'svelte';
    import IconCloseCircle from 'svelte-material-icons/CloseCircle.svelte';
    import IconAlert from 'svelte-material-icons/Alert.svelte';

	// Event dispatcher to communicate with the parent component
	const dispatch = createEventDispatcher();

	export let show: boolean = false;
	export let contentComponent: typeof SvelteComponent | null;

	// Function to handle the key press
	function handleKeydown(event: KeyboardEvent) {
		if (event.key === 'Escape') {
			closeModal();
		}
	}

	// Function to close the modal and notify the parent component
	function closeModal() {
		show = false;
		dispatch('close');
	}

	onMount(() => {
		if (typeof window !== 'undefined') {
			window.addEventListener('keydown', handleKeydown);
		}
	});

	onDestroy(() => {
		if (typeof window !== 'undefined') {
			window.removeEventListener('keydown', handleKeydown);
		}
	});
</script>

{#if show}
	<!-- svelte-ignore a11y-click-events-have-key-events -->
	<!-- svelte-ignore a11y-no-static-element-interactions -->
	<div class="modal" on:click={closeModal} in:fade={{ duration: 100 }} out:fade={{ duration: 100 }}>
		<!-- svelte-ignore a11y-click-events-have-key-events -->
		<!-- svelte-ignore a11y-no-static-element-interactions -->
		<div
			class="modal-card"
			on:click|stopPropagation
			in:fly={{ y: 200, duration: 300 }}
			out:fly={{ y: 200, duration: 300 }}
		>
			{#if contentComponent}
                <button class="close-button" aria-label="Close Modal" on:click={closeModal}><IconCloseCircle size="1.25em"/></button>
				<svelte:component this={contentComponent} />
			{:else}
				<button class="close-button" aria-label="Close Modal" on:click={closeModal}><IconCloseCircle size="1.25em"/></button>
				<p class="error-msg"><span class="error-icon"><IconAlert size="1.5em"/></span><br>No content provided</p>
			{/if}
		</div>
	</div>
{/if}

<style lang="scss">
	@import '$styles/modal-core.scss';
    @import '$styles/mobile/modal-core.scss';
</style>
