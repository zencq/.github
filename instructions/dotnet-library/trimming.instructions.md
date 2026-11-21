---
applyTo: "**/*.cs,**/*.csproj"
---

<!-- Synced from zencq/.github (instructions/dotnet-library/). Edit it there; changes made in a consuming repository are overwritten. -->

# Trimming, AOT, and the browser

- Libraries are marked `IsTrimmable` and `IsAotCompatible`, so avoid reflection-based APIs that aren't trim-safe (for example, use `JsonTypeInfo` and source-generated regex). `CheckForOverflowUnderflow` is on as well.
- Apps built on the libraries can run in the browser (WebAssembly), so each library declares `<SupportedPlatform Include="browser" />` and a call that the browser doesn't support fails the build (CA1416). Guard such calls with `OperatingSystem.IsBrowser()` or the API's own check (such as `SocketsHttpHandler.IsSupported`) and fall back to behavior that works there.
- An AOT test project, a console app that references and roots every library, is published with native AOT and run by CI, so trim and AOT warnings fail the build and missing source-generated code fails at runtime. When you add code that relies on source generation, such as a new `JsonSerializerContext`, add a check to its `Program.cs`. A new package needs a `ProjectReference` and a `TrimmerRootAssembly` in it.
- A browser test project, a WebAssembly console app (`Microsoft.NET.Sdk.WebAssembly`) that references every library, is published for every target framework and run with Node by CI, so the code that runs only in the browser (behind `OperatingSystem.IsBrowser()` or a check such as `SocketsHttpHandler.IsSupported`, and file access in the browser's in-memory file system) actually runs. When you add such code, add a check to its `Program.cs`. A new package needs a `ProjectReference` in it.
- Its `wwwroot/main.mjs` starts the runtime and exits with the app's exit code, so a failed check fails CI. Pass the assembly name and the arguments to `runMain` (`runMain(getConfig().mainAssemblyName, [])`): the .NET 8 runtime crashes without them. The publish needs no workload, only the .NET SDK and Node.
- The AOT and browser test projects have no `packages.lock.json`: the packages the SDK adds for native AOT and WebAssembly follow the installed SDK.
