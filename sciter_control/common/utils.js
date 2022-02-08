export function assert(condition, message) {
    if (!condition) {
        if (message) {
            throw `Assertion failed: ${message}`;
        } else {
            throw "Assertion failed";
        }
    }
}