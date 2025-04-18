{ inputs, pkgs, ... }:

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
     "extensions.autoDisableScopes" = 0; 
     "privacy.clearOnShutdown_v2.cache" = false;
     "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
     "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
     "signon.rememberSignons" = false;
     "widget.use-xdg-desktop-portal.file-picker" = 1;
     "browser.aboutConfig.showWarning" = false;
     "browser.compactmode.show" = true;
     "browser.cache.disk.enable" = false; 
     "mousewheel.default.delta_multiplier_x" = 20;
     "mousewheel.default.delta_multiplier_y" = 20;
     "mousewheel.default.delta_multiplier_z" = 20;
     "widget.disable-workspace-management" = true;
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
    "jid1-MnnxcxisBPnSXQ@jetpack" = {
     install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
     installation_mode = "force_installed";
    };
    "uBlock0@raymondhill.net" = {
     install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
     installation_mode = "force_installed";
    };
    "jid1-xUfzOsOFlzSOXg@jetpack" = {
     install_url = "https://addons.mozilla.org/firefox/downloads/latest/reddit-enhancement-suite/latest.xpi";
     installation_mode = "force_installed";
    };
    "{9063c2e9-e07c-4c2c-9646-cfe7ca8d0498}" = {
     install_url = "https://addons.mozilla.org/firefox/downloads/latest/old-reddit-redirect/latest.xpi";
     installation_mode = "force_installed";
    };
    "{34daeb50-c2d2-4f14-886a-7160b24d66a4}" = {
     install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-shorts-block/latest.xpi";
     installation_mode = "force_installed";
    };
    "sponsorBlocker@ajay.app" = {
     install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
     installation_mode = "force_installed";
    };
   };
  }; 
 };

}
