import { fileURLToPath, URL } from 'node:url'
import { resolve } from 'path'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    vue(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  build: {
  rollupOptions:
  {
    input: 'src/main.js',
    preserveEntrySignatures : true,
    output: {
        name: "App",
        format: "esm",
        dir: "../force-app/main/default/lwc/vue",
        assetFileNames: "vue.css",
        entryFileNames: "vue.js",
    },
    external: [/@salesforce/, /lightning\//]
}
  }
})
