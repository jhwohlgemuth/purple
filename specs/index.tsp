import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@jsonSchema
namespace Metadata;

model Artifact {
  name: string;
  description: string;
  disambiguatingDescription?: string;
  identifier: string;
  license: License;
  category: string;
  subcategory: string;

  @uniqueItems
  keywords: string[];

  isAccessibleForFree: boolean;

  @uniqueItems
  operatingSystem: OperatingSystem[];

  processorRequirements: string;
  runtimePlatform: string;
  sameAs: string;
  url: url;
  developmentStatus: Status;
  version: string;
}

enum License {
  MIT: "MIT",
}
enum OperatingSystem {
  Windows,
  Mac,
  Linux,
}
enum Status {
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
