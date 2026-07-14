# Helper function that combines a list of attributes sets into a single attribute set
{ lib, ... }:
  list: lib.foldl lib.recursiveUpdate { } list
