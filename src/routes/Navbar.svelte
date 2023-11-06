<!-- <script lang="ts">
  import { onMount } from 'svelte';
  import { writable } from 'svelte/store';

  export const activeSection = writable('home');

  function smoothScrollTo(elementId: string) {
    const element = document.getElementById(elementId);
    if (element) {
      element.scrollIntoView({
        behavior: 'smooth'
      });
    }
  }

  function updateActiveSection() {
    const sections = document.querySelectorAll('.page');

    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.offsetHeight;

        if (window.scrollY >= sectionTop && window.scrollY < (sectionTop + sectionHeight)) {
            activeSection.set(section.id);
        }
    });
  }

  onMount(() => {
    window.addEventListener('scroll', updateActiveSection);
  });

  function handleKeydown(event: KeyboardEvent) {
    // Trigger redirection on Enter key or Space bar
    if (event.key === 'Enter' || event.key === ' ') {
      smoothScrollTo('home');
    }
  }
</script> -->

<!-- <ul class="dial-navbar">
  <li class="page" id="home" on:click={() => smoothScrollTo('home')} class:active={$activeSection === 'home'}>Home</li>
  <li class="page" id="about" on:click={() => smoothScrollTo('about')} class:active={$activeSection === 'about'}>About</li>
  <li class="page" id="projects" on:click={() => smoothScrollTo('projects')} class:active={$activeSection === 'projects'}>Projects</li>
  <li class="page" id="socials" on:click={() => smoothScrollTo('socials')} class:active={$activeSection === 'socials'}>Socials</li>
</ul> -->
<!-- 
<style lang="scss">
  @import "../styles/navbar.scss";
</style> -->
