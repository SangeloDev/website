<script lang="ts">

	import HomeButton from './elements/HomeButton.svelte';
	
	// Modal
	import Modal from '$lib/components/Modal.svelte';
	import DashinitModal from '$lib/modals/dashinit.svelte';
	import SangeFaultModal from '$lib/modals/sangefault.svelte';
	import ExploreCraftModal from '$lib/modals/explorecraft.svelte';
	import UtilityClientModal from '$lib/modals/utilityclient.svelte';
	import SangeloSpaceModal from '$lib/modals/sangelospace.svelte';
	import LunivityModal from '$lib/modals/lunivity.svelte';
	import GitpotModal from '$lib/modals/gitpot.svelte';
	import MoreProjectsModal from '$lib/modals/more.svelte';
	
	let showModal = false;
	let selectedModule: any = null;

	function openModalWith(module: any) {
		selectedModule = module;
		showModal = true;
	}

	function handleModalClose() {
		showModal = false;
	}

</script>

<div id="projects" class="section">
	<header>
		<HomeButton page="projects"/>
		<h1 class="no-select">Projects</h1>
	</header>
	<content>
		<div class="container">
			<div class="grid">
				<div class="one">
					<button class="button inactive" aria-label="Inactive Button" />
					<button class="button inactive" aria-label="Inactive Button" />
					<button class="button sangelo" aria-label="Sangelo's Space" on:click={() => openModalWith(SangeloSpaceModal)} />
					<button class="button lunivity" aria-label="Lunivity" on:click={() => openModalWith(LunivityModal)} />
				</div>
				<div class="two">
					<button class="button gitpot" aria-label="Gitpot" on:click={() => openModalWith(GitpotModal)} />
					<button class="button dashinit" aria-label="Dashinit" on:click={() => openModalWith(DashinitModal)} />
					<button class="button explorecraft" aria-label="ExploreCraft" on:click={() => openModalWith(ExploreCraftModal)} />
					<button class="button utility" aria-label="UtilityClient" on:click={() => openModalWith(UtilityClientModal)} />
				</div>
				<div class="thr">
					<button class="button inactive" aria-label="Inactive Button" />
					<button class="button sangefault" aria-label="SangeFault" on:click={() => openModalWith(SangeFaultModal)} />
					<button class="button next" aria-label="More Projects..." on:click={() => openModalWith(MoreProjectsModal)} />
					<button class="button inactive" aria-label="Inactive Button" />
				</div>
			</div>
			<div class="tip">
				<p>
					Click on a<br />
					<span class="capri">bubble</span> for<br />
					more <span class="french-sky">info</span>.
				</p>
			</div>

			<!-- Show modals -->
			<Modal show={showModal} on:close={handleModalClose} contentComponent={selectedModule} />
		</div>
	</content>
</div>

<style lang="scss">
	@import '$styles/projects.scss';
</style>
