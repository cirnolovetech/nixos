{ pkgs, ... }:

 let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
  lock-empty-string = {
    Value = "";
    Status = "locked";
  };
 in
{

 programs.firefox = {
  enable = true;
  package = pkgs.librewolf;
  profiles = {
   default = {
    id = 0;
    name = "default";
    isDefault = true;
    settings = {
     "browser.search.defaultenginename" = "DuckDuckGo";
     "browser.search.order.1" = "DuckDuckGo";

     "signon.rememberSignons" = false;
     "widget.use-xdg-desktop-portal.file-picker" = 1;
     "browser.aboutConfig.showWarning" = false;
     "browser.compactmode.show" = true;
     "browser.cache.disk.enable" = false; # Be kind to hard drive

     "mousewheel.default.delta_multiplier_x" = 20;
     "mousewheel.default.delta_multiplier_y" = 20;
     "mousewheel.default.delta_multiplier_z" = 20;

     "widget.disable-workspace-management" = true;
    };


    search = {
     force = true;
     engines = {
      "Nix Packages" = {
       urls = [
        {
         template = "https://search.nixos.org/packages";
         params = [
          {
	   name = "type";
           value = "packages";
          }
          {
           name = "channel";
           value = "unstable";
          }
          {
           name = "query";
           value = "{searchTerms}";
          }
         ];
        }
       ];
       icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
       definedAliases = ["@n"];
      };
     };
    };
   };
  };


  policies = {
   DisableFirefoxAccounts = true;
   DisableAccounts = true;
   DisableFirefoxScreenshots = true;
   DisableTelemetry = true;
   DisableFirefoxStudies = true;
   EnableTrackingProtection = {
    Value= true;
    Locked = true;
    Cryptomining = true;
    Fingerprinting = true;
   };

   Preferences = { 
    "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
    "extensions.pocket.enabled" = lock-false;
    "extensions.screenshots.disabled" = lock-true;
    "browser.topsites.contile.enabled" = lock-false;
    "browser.formfill.enable" = lock-false;
    "browser.search.suggest.enabled" = lock-false;
    "browser.search.suggest.enabled.private" = lock-false;
    "browser.urlbar.suggest.searches" = lock-false;
    "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
    "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
    "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
    "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
    "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
    "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
    "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
    "browser.newtabpage.activity-stream.showSponsored" = lock-false;
    "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
    "cookiebanners.service.mode.privateBrowsing" = 2;
    "cookiebanners.service.mode" = 2;
    "privacy.donottrackheader.enabled" = true;
    "privacy.exposeContentTitleInWindow" = false;
    "privacy.fingerprintingProtection" = true;
    "privacy.resistFingerprinting" = true;
    "privacy.trackingprotection.emailtracking.enabled" = true;
    "privacy.trackingprotection.enabled" = true;
    "privacy.trackingprotection.fingerprinting.enabled" = true;
    "privacy.trackingprotection.socialtracking.enabled" = true;
    "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme,-JSDateTimeUTC";
   };

   ExtensionSettings = {
    "*".installation_mode = "blocked";

    "uBlock0@raymondhill.net" = {
     install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
     installation_mode = "force_installed";
    };
    "jid1-MnnxcxisBPnSXQ@jetpack" = {
     install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
     installation_mode = "force_installed";
    };
   };
  }; 
 };

 programs.chromium = {
  enable = true;
  extensions = [
   { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } 
   { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; }
  ];
 };

}
