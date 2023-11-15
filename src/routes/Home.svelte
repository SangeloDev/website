<script lang='ts'>
    import { goto } from '$app/navigation';

    import IconChevronDown from 'svelte-material-icons/ChevronDown.svelte';

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

<div id="home" class="section">
    <header>
        <div class="svg-container">
            <svg
                class="logo"
                width="145px"
                height="145px"
                viewBox="0 0 145 145"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
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
        </div>
        <h1>
            <span class="word-hello-world-color">Hello World</span>, I'm
            <span class="word-sangelo-color">Sangelo</span><br />and I
            <span class="word-create-color">create</span> things.
        </h1>
        <div
            class="chevron"
            on:click={()=> smoothScrollTo('about')}
            on:keydown={handleKeydown}
            role="button"
            tabindex=0
        >
            <IconChevronDown size="1.6em" />
        </div>
    </header>
</div>

<style lang="scss">
    @import '../styles/index.scss';
	@import '../styles/home.scss';
</style>