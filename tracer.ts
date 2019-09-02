import tracer from "dd-trace";
tracer.init({
  analytics: true,
  runtimeMetrics: true
}); // initialized in a different file to avoid hoisting.
export default tracer;
