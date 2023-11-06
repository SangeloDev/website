<script lang="ts">
	import { page } from '$app/stores';

	// Updated descriptions object to handle all 4xx codes
	const descriptions: { [key: string]: string } = {
		'4xx': 'Looks like you got lost in space. Try searching again at planet earth.',
		'500':
			'Looks like the website is down at the moment. Please try again later.<br>If the error persists, contact me at contact@sangelo.space',
		'200': 'Hello there! 👋',
		default: 'An unexpected error has occurred.'
	};

	// Function updated to handle all 4xx errors
	function getErrorDescription(status: number | string) {
		const statusString = status.toString();
		// Check if the status code is in the 4xx range
		if (statusString.startsWith('4') && statusString.length === 3) {
			return descriptions['4xx'];
		}
		return descriptions[statusString] || descriptions.default;
	}

	$: is400Status = $page.status?.toString().startsWith('4');
	$: errorDescription = getErrorDescription($page.status);
</script>

<content>
	<div class="text">
		<h1>{$page.status}</h1>
		{#if $page.error && $page.error.message}
			<h2>{$page.error.message}</h2>
		{/if}
		<p>{@html errorDescription}</p>
		{#if is400Status}
			<a class="button" href="/">Fly back home</a>
		{/if}
	</div>
	<div class="blob">
		<svg
			width="686"
			height="1080"
			viewBox="0 0 686 1080"
			fill="none"
			xmlns="http://www.w3.org/2000/svg"
		>
			<g filter="url(#filter0_i_1002_1047)">
				<path
					d="M88.6758 136C88.6758 34.6337 0 -8.02344 0 -66H686V1146H0C0 1146 88.6758 1044.94 88.6758 944C88.6758 843.064 0 843.419 0 742.582C0 641.745 88.6758 641.124 88.6758 540C88.6758 438.876 0 439.674 0 338.938C0 238.201 88.6758 237.366 88.6758 136Z"
					fill="url(#paint0_radial_1002_1047)"
				/>
			</g>
			<defs>
				<filter
					id="filter0_i_1002_1047"
					x="0"
					y="-66"
					width="689"
					height="1214"
					filterUnits="userSpaceOnUse"
					color-interpolation-filters="sRGB"
				>
					<feFlood flood-opacity="0" result="BackgroundImageFix" />
					<feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
					<feColorMatrix
						in="SourceAlpha"
						type="matrix"
						values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
						result="hardAlpha"
					/>
					<feOffset dx="3" dy="2" />
					<feGaussianBlur stdDeviation="4" />
					<feComposite in2="hardAlpha" operator="arithmetic" k2="-1" k3="1" />
					<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.35 0" />
					<feBlend mode="normal" in2="shape" result="effect1_innerShadow_1002_1047" />
				</filter>
				<radialGradient
					id="paint0_radial_1002_1047"
					cx="0"
					cy="0"
					r="1"
					gradientUnits="userSpaceOnUse"
					gradientTransform="translate(32 540) scale(654 3651.84)"
				>
					<stop offset="0.34828" stop-color="#00B2FA" />
					<stop offset="1" stop-color="#007DFF" />
				</radialGradient>
			</defs>
		</svg>
	</div>
</content>

<style lang="scss">
	content {
		display: flex;
		justify-content: space-between;
		align-items: stretch;
		height: 100vh;
		background-color: $space-black;
		color: white;
		z-index: 1;
	}

	.text {
		flex: 1 1 50%;
		padding: 2em;
		overflow: auto;
		font-family: $font-family;
		z-index: 3;

		h1 {
			font-size: 80px;
			margin-bottom: 0;
			margin-top: 0.2em;
			font-weight: 800;
		}

		h2 {
			font-size: 40px;
			font-weight: 500;
			margin-top: 0;
		}

		p {
			font-weight: 300;
			font-size: 22px;
			margin-bottom: 2em;
		}

		a.button {
			text-decoration: none;
			background-color: $white;
			padding: 0.6em;
			padding-left: 1.5em;
			padding-right: 1.5em;
			border-radius: 8px;
			color: $space-black;
			font-weight: 700;
			transition: opacity ease-in-out 0.3;
		}

		a.button:hover {
			opacity: 0.9;
		}

		a.button:active {
			opacity: 0.8;
		}
	}

	.blob {
		position: relative;
		flex: 1 1 50%;
		height: 100vh;

		svg {
			height: 100vh;
			width: auto;
			position: absolute;
			right: 0;
			bottom: 0;
			margin: 0;
			padding: 0;
			z-index: 2;
		}
	}

	@media (max-width: 850px) {
		.blob {
			display: none;
		}
	}
</style>
