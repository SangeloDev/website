// index.ts

import { goto } from '$app/navigation';

export function smoothScrollTo(elementId: string) {
    const element = document.getElementById(elementId);
    if (element) {
        element.scrollIntoView({
            behavior: 'smooth'
        });
    }
}

// export function redirectToHome() {
//     // goto('/');
//     smoothScrollTo('home');
// }

export function handleKeydown(event: KeyboardEvent) {
    // Trigger redirection on Enter key or Space bar
    if (event.key === 'Enter' || event.key === ' ') {
        smoothScrollTo('home');
    }
}

export function openWebsite(url: string) {
    goto(url);
}
