{
  config,
  pkgs,
  ...
}: {

  programs.sioyek = {
    enable = true;

    # Adding this option so that Sioyek stores data on special folder for mounted google drive
    # This is necessary so that bookmarks, marks, portals, etc. can be saved to the google drive
    config = {
      "shared_database_path" = "~/drive/books/.sioyek-data/shared.db";
    };
  };

}
