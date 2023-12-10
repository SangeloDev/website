<script lang="ts">
	import Modal from '../Modal.svelte';
	import DashinitModal from './dashinit.svelte';
	import SangeFaultModal from './sangefault.svelte';
	import ExploreCraftModal from './explorecraft.svelte';
	import UtilityClientModal from './utilityclient.svelte';
	import SangeloSpaceModal from './sangelospace.svelte'

	import IconCobweb from 'svelte-material-icons/SpiderWeb.svelte';
	import IconArchive from 'svelte-material-icons/ArchiveOutline.svelte';

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

<content>
	<div class="parent">
		<div class="gallery">
			<div class="next-icon" />
		</div>
		<div>
			<h1 class="modal-title no-select">All Projects</h1>
			<p class="modal-title">These are all of my projects, including the ones that didn't fit in the homepage. Take a look!</p>
			<ul class="item-list">
				<a class="item" href="https://gitpot.dev/sangelo/website" rel="noopener noreferrer" target="_blank" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/sangelo.svg" alt="Sangelo's Logo" /></div>
					<div class="item-details">
						<h2>Sangelo's Space</h2>
						<p class="item-description">This website's repository and source code.</p>
					</div>
				</a>
				<a class="item" href="https://lunivity.com" rel="noopener noreferrer" target="_blank" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/lunivity.svg" alt="Lunivity Logo" /></div>
					<div class="item-details">
						<h2>Lunivity</h2>
						<p class="item-description">Open-source by nature, self-hosted by choice. Self-hosted cloud services.</p>
					</div>
				</a>
				<a class="item" href="https://gitpot.dev" rel="noopener noreferrer" target="_blank" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/gitpot.svg" alt="Gitpot Logo" /></div>
					<div class="item-details">
						<h2>Gitpot</h2>
						<p class="item-description">Code so sweet, bugs can't compete! A Forgejo-powered git forge which is part of the Lunivity Circle.</p>
					</div>
				</a>
				<a class="item" href="https://uc.gamingcraft.de" rel="noopener noreferrer" target="_blank" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/utilityclient.svg" alt="UtilityClient Logo" /></div>
					<div class="item-details">
						<h2>UtilityClient</h2>
						<p class="item-description">Performance oriented 1.8.9 Minecraft Client. I'm responsible for UI/UX.</p>
					</div>
				</a>
				<a class="item" href="https://explorecraft.net" rel="noopener noreferrer" target="_blank" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/explorecraft.svg" alt="ExploreCraft Logo" /></div>
					<div class="item-details">
						<h2>ExploreCraft</h2>
						<p class="item-description">Minecraft 1.19.2 Quilt modpack oriented towards exploration. Powered by packwiz!</p>
					</div>
				</a>
				<a class="item" href="https://gitpot.dev/dashinit/cli" rel="noopener noreferrer" target="_blank" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/dashinit.svg" alt="dashinit Logo" /></div>
					<div class="item-details">
						<h2>dashinit</h2>
						<p class="item-description">A nim-powered initializer that's fast, fully configurable, and effortlessly sets up your projects.</p>
					</div>
				</a>
				<a class="item" href="https://github.com/SangeloDev/SangeFault" rel="noopener noreferrer" target="_blank" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/sangefault.svg" alt="SangeFault Logo" /></div>
					<div class="item-details">
						<h2>SangeFault</h2>
						<p class="item-description">Open-source Minecraft resourcepack for 1.8.9 </p>
					</div>
				</a>
			</ul>

			<h2 class="modal-title no-select"><IconArchive /> Archive</h2>
			<p class="modal-title">These are projects that have either been archived or don't see a lot of work anymore.</p>

			<ul class="item-list">
				<a class="item inactive" href="https://github.com/runestudios" rel="noopener noreferrer" target="_blank" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/runestudios.svg" alt="Sangelo's Logo" /></div>
					<div class="item-details">
						<h2>RuneStudios</h2>
						<p class="item-description">Small group of passionate devs and designers.</p>
					</div>
				</a>
				<!-- svelte-ignore a11y-no-noninteractive-tabindex -->
				<div class="item inactive" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/spectrumgalaxy.svg" alt="Sangelo's Logo" /></div>
					<div class="item-details">
						<h2>SpectrumGalaxy</h2>
						<p class="item-description">Was-to-be a Minecraft minigame server network with original minigames.</p>
					</div>
				</div>
				<a class="item inactive" href="https://github.com/SangeloDev/SpaceBot" rel="noopener noreferrer" target="_blank" tabindex="0">
					<div class="thumbnail"><img src="assets/logos/spacebot.svg" alt="Sangelo's Logo" /></div>
					<div class="item-details">
						<h2>Spacebot</h2>
						<p class="item-description">A Discord bot made to do general moderation and management tasks.</p>
					</div>
				</a>
			</ul>

			<p class="end-text">
				<IconCobweb size="2em"/><br>
				You've reached the end! There might be more projects coming soon 🤔...
			</p>
		</div>
		<!-- Show modals -->
		<Modal show={showModal} on:close={handleModalClose} contentComponent={selectedModule} />
	</div>
</content>

<style lang="scss">
	@import '../../styles/modal.scss';
	@import '../../styles/mobile/modal-mobile.scss';
	@import '../../styles/modal-more.scss';
</style>
