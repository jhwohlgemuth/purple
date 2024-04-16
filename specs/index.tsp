import "@typespec/json-schema";
import "./common.tsp";

using TypeSpec.JsonSchema;
using Common;

@jsonSchema
namespace Metadata;

model Metadata {
  identifier: url | GUID | DOI;
  description?: string;
  keywords: string[];
  items: Artifact[];
}

model Artifact {
  @key
  identifier: GUID | DOI;

  @doc("Type of software application, e.g. 'Game, Multimedia'")
  applicationCategory?: string;

  @doc("Subcategory of the application category, e.g. 'Adventure Game, Educational'")
  applicationSubCategory?: string;

  category?: string;
  codeRepository?: url;
  description?: string;
  developmentStatus: DevelopmentStatus;
  disambiguatingDescription?: string;
  isAccessibleForFree: boolean;

  @uniqueItems
  keywords: string[];

  @doc("A license document that applies to this content, typically indicated by URL")
  license?: License | url;

  name: string;

  @uniqueItems
  operatingSystem: OperatingSystem[];

  @doc("Processor architecture required to run the application (e.g. IA64)")
  processorRequirements?: string;

  @doc("Runtime platform or script interpreter dependencies (e.g. Java v1, Python2.3, .Net Framework 3.0)")
  runtimePlatform?: RuntimePlatform;

  sameAs?: url;
  targetProduct?: TargetProduct;
  url?: url;
  version?: SemanticVersion;
}
enum DevelopmentStatus {
  @doc("Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.")
  Concept,

  @doc("Work in progress")
  WIP,

  @doc(" The project has reached a stable, usable state and is being actively developed.")
  Active,

  @doc("The project has reached a stable, usable state but is no longer being actively developed.")
  Inactive,

  @doc("Work has been stopped for the time being but the author(s) intend on resuming work.")
  Suspended,

  @doc("The project has been abandoned and the author(s) do not intend on continuing development.")
  Abandoned,

  @doc("The project has reached a stable, usable state but the author(s) have ceased all work on it.")
  Unsupported,

  @doc("The project has been moved to a new location, and the version at that location should be considered authoritative.")
  Moved,
}
enum License {
  mit: "MIT",
}
enum OperatingSystem {
  linux,
  mac,
  nix,
  windows,
}
enum RuntimePlatform {
  java,
  javascript,
  node,
  python,
  webassembly,
  dotnet,
  shell,
}
@doc("Target product to which the code applies. Can be name of product or sc:SoftwareApplication.")
enum TargetProduct {
  chocolatey,
  conda,
  homebrew,
  nix,
  npm,
  pip,
  scoop,
  spack,
  vscode,
  winget,
}
