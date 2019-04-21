require 'ddtrace'
Datadog.configure do |c|
  # This will activate auto-instrumentation for Rails
  c.use :rails
  c.tracer hostname: 'dd-agent',
           port: 8126
end