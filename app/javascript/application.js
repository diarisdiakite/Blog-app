import { Turbo } from "@hotwired/turbo-rails"
import { TurboDrive } from "@hotwired/turbo-rails"
import { TurboFrames } from "@hotwired/turbo-rails"
import { TurboStream } from "@hotwired/turbo-rails"
import { TurboStreams } from "@hotwired/turbo-rails"

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "controllers"
