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
                <button class="close-button" on:click={closeModal}><IconCloseCircle size="1.25em"/></button>
				<svelte:component this={contentComponent} />
			{:else}
				<p class="error-msg"><span class="error-icon"><IconAlert size="1.5em"/></span><br>No content provided</p>
			{/if}
		</div>
	</div>
{/if}

<style lang="scss">
	.modal {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: rgba(0, 0, 0, 0.5);
		backdrop-filter: blur(8px);
		z-index: 1000;

		.modal-card {
            height: 80%;
            width: 85%;
			position: relative;
			background-color: $space-gray;
			border-radius: 2em;
			padding: 1em;
			box-shadow: 0px 2px 10px $space-black-modal;
			z-index: 1001;
            // overflow: auto;
		}

		.close-button {
			position: absolute;
			top: 0.9em;
			right: 0.8em;
			background: none;
			border: none;
			font-size: 20px;
			cursor: pointer;
			z-index: 1002;
			color: #fff;
		}

        .error-msg {
            justify-self: center;
            align-self: center;
        }

        .error-icon {
            color: #fe8484;
        }
	}
    @media (max-width: 850px) {
        .modal {
            .modal-card {
                height: 85%;
            }
        }
    }
</style>
