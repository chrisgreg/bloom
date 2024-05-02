/**
 * @type {{
 * mounted: () => void,
 * handleEvent: (event: string, callback: (payload: any) => void) => void
 * }}
 */
export const soundEffectHook = {
  mounted() {
    console.log("time to hook up the sound effect!");

    // Initialize Audio Context
    this.audioCtx = new (window.AudioContext || window.webkitAudioContext)();
    // Cache for storing fetched sounds
    this.audioCache = {};

    this.handleEvent("play_sound", ({ sound }) => {
      console.info("playing sound", sound);
      this.playSound(sound);
    });
  },

  async playSound(url) {
    try {
      // Use cached sound if available, otherwise fetch, decode, and cache it
      if (!this.audioCache[url]) {
        // Fetch sound file
        const response = await fetch(url);
        const arrayBuffer = await response.arrayBuffer();
        // Decode audio data to be used by the AudioContext
        const audioBuffer = await this.audioCtx.decodeAudioData(arrayBuffer);
        // Store the decoded buffer in cache
        this.audioCache[url] = audioBuffer;
      }
      // Play the sound from the cache
      this.playAudioBuffer(this.audioCache[url]);
    } catch (err) {
      console.error("Error playing sound:", err);
    }
  },

  playAudioBuffer(audioBuffer) {
    // Create a buffer source node
    const source = this.audioCtx.createBufferSource();
    source.buffer = audioBuffer;
    source.connect(this.audioCtx.destination); // Connect to the output (speakers)
    source.start(0); // Play immediately
  },
};
