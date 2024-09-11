/**
 * @type {{
 * mounted: () => void,
 * handleEvent: (event: string, callback: (payload: any) => void) => void
 * audioCtx: AudioContext,
 * audioCache: Record<string, AudioBuffer>,
 * }}
 */
export const soundEffectHook = {
  mounted() {
    // Initialize Audio Context
    this.audioCtx = new (window.AudioContext || window.webkitAudioContext)();

    // Try to resume AudioContext in case it's suspended
    this.resumeAudioContext();

    // Cache for storing fetched sounds
    this.audioCache = {};

    this.handleEvent("play_sound", ({ sound }) => {
      console.info("playing sound", sound);
      this.playSound(sound);
    });
  },

  /**
   * @param {string} url
   */
  async playSound(url) {
    try {
      // Ensure the AudioContext is running
      await this.resumeAudioContext();

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

  /**
   * Checks for a suspended AudioContext and attempts to resume it
   */
  async resumeAudioContext() {
    if (this.audioCtx.state === "suspended") {
      // Attempt to resume the AudioContext
      return this.audioCtx.resume();
    }
    // Return a resolved promise for consistency in asynchronous behavior
    return Promise.resolve();
  },
};
