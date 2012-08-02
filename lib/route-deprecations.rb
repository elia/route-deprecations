require 'route-deprecations/version'
require 'route-deprecations/route'

ActionController::Routing::Route.send :include, RouteDeprecations::Route
