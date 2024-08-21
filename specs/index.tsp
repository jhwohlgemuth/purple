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

  applicationCategory: ApplicationCategory;
  applicationSubCategory?: ApplicationSubCategory;
  category?: string;
  codeRepository?: url;
  description?: string;
  developmentStatus: DevelopmentStatus;

  @doc("Short description of the item used to disambiguate from other, similar items - usually the associated CLI app command")
  disambiguatingDescription?: string;

  @doc("A flag to signal that the publication is accessible for free")
  isAccessibleForFree: boolean;

  @uniqueItems
  @doc("Keywords or tags used to describe this content")
  keywords: Keyword[];

  @doc("A license document that applies to this content, typically indicated by URL")
  license?: License | url;

  name: string;

  @uniqueItems
  operatingSystem: OperatingSystem[];

  @doc("Processor architecture required to run the application (e.g. IA64)")
  processorRequirements?: string;

  @doc("Runtime platform or script interpreter dependencies (e.g. Java v1, Python2.3, .Net Framework 3.0)")
  runtimePlatform?: RuntimePlatform;

  @doc("URL of a reference Web page that unambiguously indicates the item's identity")
  sameAs?: url;

  @doc("Target Operating System / Product to which the code applies")
  targetProduct?: TargetProduct;

  url?: url;
  version?: SemanticVersion;
}
@doc("Type of software application")
enum ApplicationCategory {
  package,
  package_manager: "package-manager",
  extension,
}
@doc("Subcategory of the application category")
enum ApplicationSubCategory {
  cask,
  correctness,
  dotnet: "language::dotnet",
  elixir: "language::elixir",
  formula,
  latex,
  python: "language::python",
  rust: "language::rust",
  scala: "language::scala",
  webassembly,
  frontend,
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
enum Keyword {
  admin,
  architecture,
  bucket_nerd_font: "bucket::nerd-fonts",
  cask,
  cpu,
  css,
  editor,
  font,
  git,
  markdown,
  navigation,
  research,
  search,
  security,
  static_analysis: "static-analysis",
  syntax_highlighting: "syntax-highlighting",
  coq: "language::coq",
  lean: "language::lean",
  rust: "language::rust",
  ocaml: "language::ocaml",
  why3,
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
