// app/javascript/controllers/index.js
import { Application } from "@hotwired/stimulus"
import HelloController from "./hello_controller"
import ChartController from "./chart_controller"
import SearchController from "./search_controller"

const application = Application.start()
application.register("hello", HelloController)
application.register("chart", ChartController)
application.register("search", SearchController)
