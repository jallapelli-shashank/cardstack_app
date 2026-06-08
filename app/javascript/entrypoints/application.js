import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import { registerControllers } from "stimulus-vite-helpers"
import * as bootstrap from 'bootstrap'

// Start the Stimulus application
const application = Application.start()

// Use Vite's glob import feature to find all files ending in _controller.js
const controllers = import.meta.glob("../controllers/**/*_controller.js", { eager: true })

// Automatically register them with their file-based identifiers
registerControllers(application, controllers)

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.glob('./**/*_channel.js', { eager: true })

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
