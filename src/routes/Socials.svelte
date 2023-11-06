<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { slide } from 'svelte/transition';

	// Icons
	import IconDiscord from 'svelte-material-icons/Discord.svelte';
	import IconYouTube from 'svelte-material-icons/Youtube.svelte';
	import IconGitHub from 'svelte-material-icons/Github.svelte';
	import IconEmailFast from 'svelte-material-icons/EmailFast.svelte';
	import IconMatrix from 'svelte-material-icons/Matrix.svelte';
	// import IconGitpot from '$lib/IconGitpot.svelte';
	import IconChevronDown from 'svelte-material-icons/ChevronDown.svelte';
	import IconChevronUp from 'svelte-material-icons/ChevronUp.svelte';

	// Initialisations

	let showMore = false;

	const emojis = [
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ❤️',
		'with ☕️',
		'with 🍵',
		'with 🍪',
		'with 💤',
		'with passion',
		'on a 💻',
		'in 🏫',
		'at 🏠',
		'with <img src="/assets/emojis/vscodium.png" alt="VSCodium" style="height: 18px;"/>',
		'with <img src="/assets/emojis/stackoverflow.png" alt="StackOverflow" style="height: 18px;"/>'
	];

	let emoji = '';

	// Functions

	function changeEmoji() {
		emoji = emojis[Math.floor(Math.random() * emojis.length)];
	}

	function toggleShowMore() {
		showMore = !showMore;
	}

	onMount(() => {
		changeEmoji();
	});

	function smoothScrollTo(elementId: string) {
		const element = document.getElementById(elementId);
		if (element) {
			element.scrollIntoView({
				behavior: 'smooth'
			});
		}
	}

	function redirectToHome() {
		// goto('/');
		smoothScrollTo('home');
	}

	function handleKeydown(event: KeyboardEvent) {
		// Trigger redirection on Enter key or Space bar
		if (event.key === 'Enter' || event.key === ' ') {
			redirectToHome();
		}
	}

	function openWebsite(url: string) {
		goto(url);
	}
</script>

<div id="socials" class="section">
	<content>
		<div class="button-container">
			<a
				href="https://discord.com/users/373525255102136341"
				target="_blank"
				rel="noopener noreferrer"
				class="round-button button discord"
				aria-label="Discord"
			>
				<IconDiscord class="icon" size="2.5em" />
			</a>
			<a
				href="https://youtube.com/@Sangeloo"
				target="_blank"
				rel="noopener noreferrer"
				class="round-button button youtube"
				aria-label="YouTube"
			>
				<IconYouTube class="icon" size="3em" />
			</a>
			<a
				href="https://github.com/SangeloDev"
				target="_blank"
				rel="noopener noreferrer"
				class="round-button button github"
				aria-label="GitHub"
			>
				<IconGitHub class="icon" size="3em" />
			</a>
			<a
				href="mailto:contact@sangelo.space"
				target="_blank"
				rel="noopener noreferrer"
				class="round-button button email"
				aria-label="Email"
			>
				<IconEmailFast class="icon" size="3em" />
			</a>
		</div>
		<div class="button-container below">
			{#if showMore}
				<div class="button-container below" transition:slide>
					<!-- <div > -->
					<a href="#top" class="round-button button inactive" aria-label="Inactive" />
					<a
						href="https://matrix.to/#/@sangelo:matrix.org"
						target="_blank"
						rel="noopener noreferrer"
						class="round-button button matrix"
						aria-label="Matrix"
					>
						<IconMatrix class="icon" size="2.5em" />
					</a>
					<a
						href="https://gitpot.dev/Sangelo"
						target="_blank"
						rel="noopener noreferrer"
						class="round-button button gitpot"
						aria-label="Gitpot"
					>
						<!-- <img src="/assets/icons/gitpot.svg" class="icon gitpot" /> -->
						<!-- <IconGitpot class="icon gitpot"/> -->
						<svg
							class="icon gitpot"
							width="220"
							height="220"
							viewBox="0 0 220 220"
							fill="none"
							xmlns="http://www.w3.org/2000/svg"
						>
							<g clip-path="url(#clip0_309_10)">
								<path
									fill-rule="evenodd"
									clip-rule="evenodd"
									d="M77.039 8.90552L111.492 67.9484C120.704 83.6564 77.5623 84.511 72.6278 75.7048L45.4398 27.2507C42.8514 22.6278 42.3906 17.0945 44.191 12.11C45.9914 7.12537 49.8697 3.19524 54.7915 1.3545L55.3945 1.12769C63.5194 -1.91261 72.6378 1.36534 77.039 8.90552Z"
									fill="#FFFFFF"
								/>
								<path
									fill-rule="evenodd"
									clip-rule="evenodd"
									d="M150.929 106.236C141.019 106.236 141.019 90.7225 150.929 90.7225H173.605C175.058 90.7225 176.44 90.1425 177.473 89.1089C178.496 88.0649 179.07 86.6677 179.07 85.1994V85.1683C179.07 82.1176 176.624 79.6452 173.605 79.6452H46.3922C43.3738 79.6452 40.9275 82.1176 40.9275 85.1683V85.1994C40.9275 86.6677 41.5014 88.0649 42.5241 89.1089C43.5571 90.1425 44.9395 90.7225 46.3922 90.7225H67.9734C77.8833 90.7225 77.8832 106.236 67.9734 106.236H46.3922C40.8762 106.236 35.5759 104.023 31.6768 100.072C27.7676 96.1314 25.5784 90.7744 25.5784 85.1994V85.1682C25.5784 73.5436 34.901 64.132 46.3922 64.132H173.605C185.096 64.132 194.419 73.5436 194.419 85.1682V85.1994C194.419 90.7744 192.229 96.1313 188.32 100.072C184.421 104.023 179.121 106.236 173.605 106.236H150.929Z"
									fill="#FFFFFF"
								/>
								<path
									fill-rule="evenodd"
									clip-rule="evenodd"
									d="M84.4197 172.725C78.3108 172.725 72.4576 170.263 68.1388 165.91C63.8201 161.545 61.3962 155.62 61.3962 149.455V71.8896C61.3962 67.5975 64.8343 64.1331 69.0707 64.1331H135.585C141.694 64.1331 147.547 66.5846 151.866 70.9477C156.184 75.3021 158.608 81.2267 158.608 87.4027V118.429C158.608 131.274 148.304 141.699 135.585 141.699C122.865 141.699 112.561 131.274 112.561 118.429V113.257C112.561 111.82 111.415 110.672 110.004 110.672C108.592 110.672 107.446 111.82 107.446 113.257V149.455C107.446 162.3 97.1419 172.725 84.4224 172.725H84.4197Z"
									fill="#FFFFFF"
								/>
								<path
									fill-rule="evenodd"
									clip-rule="evenodd"
									d="M173.935 101.839C172.104 97.9813 173.711 93.3482 177.528 91.4871C181.344 89.6363 185.928 91.2603 187.77 95.1178C193.204 106.536 196.253 119.329 196.253 132.825C196.253 180.938 157.605 220 110 220C62.3958 220 23.7473 180.938 23.7473 132.825C23.7473 119.329 26.7966 106.536 32.2305 95.1178C34.0721 91.2603 38.6561 89.6364 42.4727 91.4871C46.2894 93.3483 47.8962 97.9813 46.065 101.839C41.6041 111.219 39.0961 121.727 39.0961 132.823C39.0961 172.372 70.8682 204.485 110 204.485C149.132 204.485 180.904 172.373 180.904 132.823C180.904 121.727 178.398 111.219 173.935 101.839Z"
									fill="#FFFFFF"
								/>
								<path
									fill-rule="evenodd"
									clip-rule="evenodd"
									d="M171.396 204.482C175.633 204.482 179.071 207.957 179.071 212.239C179.071 216.521 175.633 219.995 171.396 219.995H48.6038C44.3674 219.995 40.9293 216.521 40.9293 212.239C40.9293 207.957 44.3674 204.482 48.6038 204.482H171.396Z"
									fill="#FFFFFF"
								/>
								<path
									fill-rule="evenodd"
									clip-rule="evenodd"
									d="M23.0236 204.482C27.26 204.482 30.6981 207.957 30.6981 212.239C30.6981 216.521 27.26 219.995 23.0236 219.995H7.67452C3.4381 219.995 0 216.521 0 212.239C0 207.957 3.4381 204.482 7.67452 204.482H23.0236Z"
									fill="#FFFFFF"
								/>
								<path
									fill-rule="evenodd"
									clip-rule="evenodd"
									d="M212.325 204.482C216.562 204.482 220 207.957 220 212.239C220 216.521 216.562 219.995 212.325 219.995H196.976C192.74 219.995 189.302 216.521 189.302 212.239C189.302 207.957 192.74 204.482 196.976 204.482H212.325Z"
									fill="#FFFFFF"
								/>
							</g>
							<defs>
								<clipPath id="clip0_309_10">
									<rect width="220" height="220" fill="white" />
								</clipPath>
							</defs>
						</svg>
					</a>
					<a href="#top" class="round-button button inactive" aria-label="Inactive" />
				</div>
			{/if}
		</div>
		<a class="toggle-more" href="#socials" on:click={toggleShowMore} role="button" class:active={showMore}>
			{#if showMore}
				Less <IconChevronUp />
			{:else}
				More <IconChevronDown />
			{/if}
		</a>
	</content>
	<footer>
		<svg
			role="button"
			class="logo"
			width="145px"
			height="145px"
			viewBox="0 0 145 145"
			fill="none"
			xmlns="http://www.w3.org/2000/svg"
			tabindex="0"
			on:click={redirectToHome}
			on:keydown={handleKeydown}
		>
			<mask
				id="mask0_1404_2"
				style="mask-type: alpha"
				maskUnits="userSpaceOnUse"
				x="27"
				y="0"
				width="90"
				height="145"
			>
				<path
					d="M46.7029 141.913C42.9858 137.94 41.035 133.479 41.035 128.952C41.035 123.914 39.9988 121.93 34.0581 115.588C28.1576 109.29 27.0886 106.668 28.273 101.396C29.947 93.9459 32.7227 91.6033 55.6196 78.3162C61.4926 74.908 66.5691 71.4125 66.9008 70.5483C67.6262 68.658 64.9196 64.838 61.5525 63C60.2091 62.2666 54.8908 59.7224 49.7341 57.3461C39.1468 52.4674 32.7016 47.2533 31.3911 42.5068C30.1104 37.8687 31.7499 30.4195 34.7377 27.3009C37.9507 23.9472 54.3659 14.1964 67.4147 7.89039C85.1571 -0.683936 95.0145 -1.86142 100.781 3.90474C104.255 7.37954 104.579 13.2727 101.562 18.1536C98.9972 22.3035 91.6993 28.4086 84.3922 32.5169C81.2408 34.2887 78.5255 36.4495 78.3581 37.3187C77.951 39.4328 82.2355 42.5665 97.3121 51.1814C111.526 59.3033 115.249 62.9778 115.998 69.6225C116.587 74.8466 114.675 79.0223 110.161 82.372C108.414 83.6682 99.8315 88.381 91.0892 92.8447C68.9024 104.173 64.9926 108.482 63.8666 122.844C62.919 134.93 57.5476 144.6 51.7823 144.6C50.2443 144.6 48.2099 143.524 46.7029 141.913Z"
					fill="#131313"
				/>
			</mask>
			<g mask="url(#mask0_1404_2)">
				<rect width="144.6" height="36.15" fill="#00C4FB" />
				<rect y="36.15" width="144.6" height="36.15" fill="#00B1FA" />
				<rect y="72.3" width="144.6" height="36.15" fill="#0091FB" />
				<rect y="108.45" width="144.6" height="36.15" fill="#0075F7" />
			</g>
		</svg>
		<p class="no-select footer footer-credits">&copy; Sangelo 2023-2024, All rights reserved.</p>
		<p class="no-select footer footer-text">
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<!-- svelte-ignore a11y-no-static-element-interactions -->
			Designed and developed
			<span class="dynamic-icon" on:click={() => openWebsite('https://sangelo.space')}
				>{@html emoji}</span
			> by Sangelo.
		</p>
	</footer>
</div>

<style lang="scss">
	@import '../styles/socials.scss';

    // .rotate-up {
	// 	transform: rotate(0deg);
	// 	transition: transform 0.3s ease-in-out;
	// }

	// .rotate-down {
	// 	transform: rotate(180deg);
	// 	transition: transform 0.3s ease-in-out;
	// }
</style>
