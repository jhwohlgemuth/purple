namespace Common;

@doc("https://www.crossref.org/blog/dois-and-matching-regular-expressions/")
@pattern("^10.\\d{4,9}/[-._;()/:A-Z0-9]+$")
scalar DOI extends string;

@pattern("^[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}$")
scalar GUID extends string;

@pattern("^\\d{1,4}\\.\\d{1,4}\\.\\d{1,4}$")
scalar SemanticVersion extends string;
