// Медиа запрос на мобильные устройства

export const mobile = (() => {
    if (window.matchMedia) {
        return window.matchMedia('screen and (max-width: 480px)');
    } else {
        return {matches: false};
    }
})();
