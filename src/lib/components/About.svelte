<script lang="ts">
    import HomeButton from "./elements/HomeButton.svelte";
</script>

<div id="about" class="section">
    <header>
        <HomeButton page="about"/>
        <h1 class="no-select">About me</h1>
    </header>
    <content>
        <div class="about-text">
            <h2>Hi! It's me, <span class="sangelo">Sangelo</span>.</h2>
            <p>
                I'm a guy who does stuff.<br />
                <br />
                I enjoy creating a variety of things, including UI prototypes, scripts, and programs. Although
                I'm new to programming, I love learning new languages. I support open-source software and design
                my workflow around it, using Linux and self-hosted tools daily.
            </p>
        </div>
    </content>
</div>

<style lang="scss">
    @import '$styles/about.scss';
</style>